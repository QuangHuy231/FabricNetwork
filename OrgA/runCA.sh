export PATH=${PWD}/bin:$PATH
# mkdir -p /home/huy/FabricNetwork/OrgA/CA-server
cd /home/huy/FabricNetwork/OrgA/CA-server

# fabric-ca-server init -b admin:adminpw

fabric-ca-server start 

