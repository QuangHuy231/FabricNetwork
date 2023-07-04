export PATH=${PWD}/bin:$PATH
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="OrgDMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/huy/FabricNetwork/OrgD/Admin/tls/tlscacerts/tls-localhost-10054-ca-orgD.pem
export CORE_PEER_MSPCONFIGPATH=/home/huy/FabricNetwork/OrgD/Admin/msp
export CORE_PEER_ADDRESS=localhost:10051
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgD/Peer0Config
export CHANNEL_NAME=mychannel

# export ORDERER_CA=/home/huy/FabricNetwork/Org4/InfoOfOrd/localhost-11054-ca-orderer.pem

peer channel join -b ./genesisBlock/$CHANNEL_NAME.block
#  peer channel list
# peer channel fetch config ./mychannel1.block -o localhost:9050  -c $CHANNEL_NAME --tls --cafile $ORDERER_CA