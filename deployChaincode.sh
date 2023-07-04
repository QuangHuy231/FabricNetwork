export PATH=${PWD}/bin:$PATH
export FABRIC_CFG_PATH=/home/huy/FabricNetwork/OrgOrderer/peer1Config

peer lifecycle chaincode package javascript.tar.gz --path /home/huy/FabricNetwork/chaincode-javascript  --lang node --label myccjavascript_1.0