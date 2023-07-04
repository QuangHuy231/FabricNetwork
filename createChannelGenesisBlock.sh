export PATH=${PWD}/bin:$PATH
export CHANNEL_NAME=mychannel
createChannelGenesisBlock(){
    configtxgen -profile FourOrgsApplicationGenesis -outputBlock ./${CHANNEL_NAME}.block -channelID $CHANNEL_NAME
}
echo "Generating channel genesis block '${CHANNEL_NAME}.block'"
createChannelGenesisBlock

mkdir -p /home/huy/FabricNetwork/OrgA/genesisBlock /home/huy/FabricNetwork/OrgB/genesisBlock /home/huy/FabricNetwork/OrgC/genesisBlock /home/huy/FabricNetwork/OrgD/genesisBlock /home/huy/FabricNetwork/OrgOrderer/genesisBlock


cp ./$CHANNEL_NAME.block /home/huy/FabricNetwork/OrgA/genesisBlock/$CHANNEL_NAME.block
cp ./$CHANNEL_NAME.block /home/huy/FabricNetwork/OrgB/genesisBlock/$CHANNEL_NAME.block
cp ./$CHANNEL_NAME.block /home/huy/FabricNetwork/OrgC/genesisBlock/$CHANNEL_NAME.block
cp ./$CHANNEL_NAME.block /home/huy/FabricNetwork/OrgD/genesisBlock/$CHANNEL_NAME.block
cp ./$CHANNEL_NAME.block /home/huy/FabricNetwork/OrgOrderer/genesisBlock/$CHANNEL_NAME.block
