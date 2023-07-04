export PATH=${PWD}/bin:$PATH
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="OrdererMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/huy/FabricNetwork/OrgOrderer/Admin1/tls/tlscacerts/tls-localhost-11054-ca-orderer.pem
export CORE_PEER_MSPCONFIGPATH=/home/huy/FabricNetwork/OrgOrderer/Admin1/msp
export CORE_PEER_ADDRESS=localhost:12051
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgOrderer/peer1Config
export CHANNEL_NAME=mychannel

# export ORDERER_CA=/home/huy/FabricNetwork/OrgOrd/example.com/msp/cacerts/localhost-11054-ca-orderer.pem

peer channel join -b ./genesisBlock/$CHANNEL_NAME.block
#  peer channel list
# peer channel fetch config ./mychannel1.block -o localhost:9050  -c $CHANNEL_NAME --tls --cafile $ORDERER_CA