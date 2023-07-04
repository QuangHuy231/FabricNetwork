export PATH=${PWD}/bin:$PATH
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="OrgCMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/huy/FabricNetwork/OrgC/Admin/tls/tlscacerts/tls-localhost-9054-ca-orgC.pem
export CORE_PEER_MSPCONFIGPATH=/home/huy/FabricNetwork/OrgC/Admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgC/Peer0Config
export CHANNEL_NAME=mychannel
export CHAINCODE_NAME=mycc
export ORDERER_CA=/home/huy/FabricNetwork/OrgA/InfoOfOrd/localhost-11054-ca-orderer.pem


peer lifecycle chaincode install ../javascript.tar.gz
export CC_PACKAGE_ID=mycc_1.0:132c5fc944c24b00ac518a40cfa6484dbd7925372bb5aa13c09673bc8ab75967
peer lifecycle chaincode approveformyorg -o localhost:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --name $CHAINCODE_NAME --version 1.0 --package-id $CC_PACKAGE_ID  --sequence 1