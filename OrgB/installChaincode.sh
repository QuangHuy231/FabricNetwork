export PATH=${PWD}/bin:$PATH
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="OrgBMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/huy/FabricNetwork/OrgB/Admin/tls/tlscacerts/tls-localhost-8054-ca-orgB.pem
export CORE_PEER_MSPCONFIGPATH=/home/huy/FabricNetwork/OrgB/Admin/msp
export CORE_PEER_ADDRESS=localhost:8051
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgB/Peer0Config
export CHANNEL_NAME=mychannel
export CHAINCODE_NAME=myccjavascript
export ORDERER_CA=/home/huy/FabricNetwork/OrgA/InfoOfOrd/localhost-11054-ca-orderer.pem


peer lifecycle chaincode install ../javascript.tar.gz
export CC_PACKAGE_ID=myccjavascript_1.0:eb26395f4def9b0b0b25e19da367fe1c9203e04fc419bf04b830f6ab73d88933
peer lifecycle chaincode approveformyorg -o localhost:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CHAINCODE_NAME --version 1.0 --package-id $CC_PACKAGE_ID  --sequence 1