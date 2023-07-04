export PATH=${PWD}/bin:$PATH
mkdir -p /home/huy/FabricNetwork/OrgD/CA-server
cd /home/huy/FabricNetwork/OrgD/CA-server

# fabric-ca-server init -b admin:adminpw

fabric-ca-server start 
