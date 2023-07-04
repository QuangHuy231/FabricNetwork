export PATH=${PWD}/bin:$PATH
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="OrgAMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/home/huy/FabricNetwork/OrgA/Admin/tls/tlscacerts/tls-localhost-7054-ca-orgA.pem
export CORE_PEER_MSPCONFIGPATH=/home/huy/FabricNetwork/OrgA/Admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgA/Peer0Config
export CHANNEL_NAME=mychannel
export CHAINCODE_NAME=mycc
export ORDERER_CA=/home/huy/FabricNetwork/OrgA/InfoOfOrd/localhost-11054-ca-orderer.pem

# peer lifecycle chaincode install /home/huy/FabricNetwork/chaincode-external/mycc.tgz
# peer lifecycle chaincode queryinstalled

export CC_PACKAGE_ID=mycc_1.0:132c5fc944c24b00ac518a40cfa6484dbd7925372bb5aa13c09673bc8ab75967
# peer lifecycle chaincode approveformyorg -o localhost:7050 --tls --cafile $ORDERER_CA --channelID $CHANNEL_NAME --init-required  --name $CHAINCODE_NAME --version 1.0 --package-id $CC_PACKAGE_ID --signature-policy "OR('OrgAMSP.member', 'OrgBMSP.member')" --sequence 1

# peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME --name $CHAINCODE_NAME --init-required --version 1.0 --sequence 1 --tls --cafile $ORDERER_CA --output json

# peer lifecycle chaincode commit -o localhost:7050 --channelID $CHANNEL_NAME --name $CHAINCODE_NAME --version 1.0 --sequence 1 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgA/Admin/tls/tlscacerts/tls-localhost-7054-ca-orgA.pem  --peerAddresses localhost:8051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgB/Admin/tls/tlscacerts/tls-localhost-8054-ca-orgB.pem --peerAddresses localhost:9051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgC/Admin/tls/tlscacerts/tls-localhost-9054-ca-orgC.pem  --peerAddresses localhost:10051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgD/Admin/tls/tlscacerts/tls-localhost-10054-ca-orgD.pem --peerAddresses localhost:12051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgOrderer/Admin1/tls/tlscacerts/tls-localhost-11054-ca-orderer.pem

# peer lifecycle chaincode commit -o localhost:7050 --channelID $CHANNEL_NAME --name $CHAINCODE_NAME --version 1.0 --init-required --sequence 1 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgA/Admin/tls/tlscacerts/tls-localhost-7054-ca-orgA.pem --peerAddresses localhost:8051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgB/Admin/tls/tlscacerts/tls-localhost-8054-ca-orgB.pem --signature-policy "OR('OrgAMSP.member', 'OrgBMSP.member')"

# peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n $CHAINCODE_NAME --peerAddresses localhost:7051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgA/Admin/tls/tlscacerts/tls-localhost-7054-ca-orgA.pem  --peerAddresses localhost:8051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgB/Admin/tls/tlscacerts/tls-localhost-8054-ca-orgB.pem --peerAddresses localhost:9051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgC/Admin/tls/tlscacerts/tls-localhost-9054-ca-orgC.pem  --peerAddresses localhost:10051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgD/Admin/tls/tlscacerts/tls-localhost-10054-ca-orgD.pem --peerAddresses localhost:12051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgOrderer/Admin1/tls/tlscacerts/tls-localhost-11054-ca-orderer.pem  -c '{"Args":["CreateAsset","asset100","300","hello", "hi", "asset"]}'

# peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA -C $CHANNEL_NAME -n $CHAINCODE_NAME --isInit --peerAddresses localhost:7051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgA/Admin/tls/tlscacerts/tls-localhost-7054-ca-orgA.pem --peerAddresses localhost:8051 --tlsRootCertFiles /home/huy/FabricNetwork/OrgB/Admin/tls/tlscacerts/tls-localhost-8054-ca-orgB.pem -c '{"function":"InitLedger","Args":[]}'

peer chaincode query -C $CHANNEL_NAME -n $CHAINCODE_NAME -c '{"Args":["GetAllAssets"]}'
