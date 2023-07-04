export PATH=${PWD}/bin:$PATH
export ORDERER_TLS_ROOT_CA=/home/huy/FabricNetwork/OrgOrderer/Orderer1/tls/tlscacerts/tls-localhost-11054-ca-orderer.pem
export ORDERER1_TLS_SIGN_CERT=/home/huy/FabricNetwork/OrgOrderer/Orderer1/tls/signcerts/cert.pem
export ORDERER1_TLS_PRIVATE_KEY=/home/huy/FabricNetwork/OrgOrderer/Orderer1/tls/keystore/server.key
export ORDERER2_TLS_SIGN_CERT=/home/huy/FabricNetwork/OrgOrderer/Orderer2/tls/signcerts/cert.pem
export ORDERER2_TLS_PRIVATE_KEY=/home/huy/FabricNetwork/OrgOrderer/Orderer2/tls/keystore/server.key
export ORDERER3_TLS_SIGN_CERT=/home/huy/FabricNetwork/OrgOrderer/Orderer3/tls/signcerts/cert.pem
export ORDERER3_TLS_PRIVATE_KEY=/home/huy/FabricNetwork/OrgOrderer/Orderer3/tls/keystore/server.key
export CHANNEL_NAME=mychannel



createChannel(){
    osnadmin channel join --channelID $CHANNEL_NAME --config-block ./genesisBlock/${CHANNEL_NAME}.block -o localhost:7053 --ca-file $ORDERER_TLS_ROOT_CA --client-cert $ORDERER1_TLS_SIGN_CERT --client-key $ORDERER1_TLS_PRIVATE_KEY
}


addOrderer(){
    osnadmin channel join --channelID $CHANNEL_NAME --config-block ./genesisBlock/${CHANNEL_NAME}.block -o localhost:8053 --ca-file $ORDERER_TLS_ROOT_CA --client-cert $ORDERER2_TLS_SIGN_CERT --client-key $ORDERER2_TLS_PRIVATE_KEY
    osnadmin channel join --channelID $CHANNEL_NAME --config-block ./genesisBlock/${CHANNEL_NAME}.block -o localhost:9053 --ca-file $ORDERER_TLS_ROOT_CA --client-cert $ORDERER3_TLS_SIGN_CERT --client-key $ORDERER3_TLS_PRIVATE_KEY
}


echo "Create Channel"
createChannel
echo "Add another Orderers"
addOrderer


