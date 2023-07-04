export PATH=${PWD}/bin:$PATH
mkdir -p /home/huy/FabricNetwork/OrgOrderer/CA-server
cd /home/huy/FabricNetwork/OrgOrderer/CA-server

# fabric-ca-server init -b admin:adminpw

fabric-ca-server start 

