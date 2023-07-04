export PATH=/home/huy/FabricNetwork/OrgOrderer/bin:$PATH
export CORE_PEER_TLS_ENABLED=true
export ORDERER_CA=/home/huy/FabricNetwork/OrgOrderer/InfoOfOrd/localhost-11054-ca-orderer.pem


export CHANNEL_NAME=mychannel

export CORE_PEER_LOCALMSPID="OrdererMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/huy/FabricNetwork/OrgOrderer/Admin1/tls/tlscacerts/tls-localhost-11054-ca-orderer.pem
export CORE_PEER_MSPCONFIGPATH=/home/huy/FabricNetwork/OrgOrderer/Admin1/msp
export CORE_PEER_ADDRESS=localhost:11051
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgOrderer/peer0Config


removeFolder(){
    rm -rf /home/huy/FabricNetwork/OrgOrderer/setAnchorPeer
    mkdir -p /home/huy/FabricNetwork/OrgOrderer/setAnchorPeer
}

setAnchorPeer(){
    # fetch config block
    peer channel fetch config config_block.pb -o localhost:7050  -c $CHANNEL_NAME --tls --cafile $ORDERER_CA
    # convert to json
    configtxlator proto_decode --input config_block.pb --type common.Block --output config_block.json
    jq .data.data[0].payload.data.config config_block.json > config.json
    # add Anchor peer
    jq '.channel_group.groups.Application.groups.OrdererOrg.values += {"AnchorPeers":{"mod_policy": "Admins","value":{"anchor_peers": [{"host": "localhost","port": '11051'}]},"version": "0"}}' config.json > modified_config.json

    # config update
    configtxlator proto_encode --input config.json --type common.Config --output config.pb
    configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb
    configtxlator compute_update --channel_id $CHANNEL_NAME --original config.pb --updated modified_config.pb --output config_update.pb
    configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json
    echo '{"payload":{"header":{"channel_header":{"channel_id":"'$CHANNEL_NAME'", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json
    configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb

    peer channel update -o localhost:7050  -c $CHANNEL_NAME -f config_update_in_envelope.pb  --tls --cafile $ORDERER_CA
}



removeFolder
cd setAnchorPeer
setAnchorPeer


