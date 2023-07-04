# export PATH=/home/huy/FabricNetwork/OrgOrderer/bin:$PATH
# echo "Enrolling the CA admin"
# mkdir -p ./bootstrapAdmin  
# cp /home/huy/FabricNetwork/OrgOrderer/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem

# export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin
#   set -x
# fabric-ca-client enroll -u https://admin:adminpw@localhost:11054 --caname ca-orderer --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
#   { set +x; } 2>/dev/null
#   set -x
# fabric-ca-client register --caname ca-orderer --id.name orderer1 --id.secret orderer1pw --id.type orderer --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
#   { set +x; } 2>/dev/null

#  set -x
# fabric-ca-client register --caname ca-orderer --id.name orderer2 --id.secret orderer2pw --id.type orderer --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
#   { set +x; } 2>/dev/null

#   set -x
# fabric-ca-client register --caname ca-orderer --id.name orderer3 --id.secret orderer3pw --id.type orderer --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
#   { set +x; } 2>/dev/null


# mkdir -p ./Orderer1
# cp /home/huy/FabricNetwork/OrgOrderer/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgOrderer/Orderer1/tls-cert.pem
# export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/Orderer1
#   set -x
# fabric-ca-client enroll -u https://orderer1:orderer1pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Orderer1/msp --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Orderer1/tls-cert.pem
#  { set +x; } 2>/dev/null
# mv /home/huy/FabricNetwork/OrgOrderer/Orderer1/msp/keystore/* /home/huy/FabricNetwork/OrgOrderer/Orderer1/msp/keystore/server.key
#     set -x
# fabric-ca-client enroll -u https://orderer1:orderer1pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Orderer1/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Orderer1/tls-cert.pem
#   { set +x; } 2>/dev/null
# mv /home/huy/FabricNetwork/OrgOrderer/Orderer1/tls/keystore/* /home/huy/FabricNetwork/OrgOrderer/Orderer1/tls/keystore/server.key
# set -x
# echo 'NodeOUs:
#   Enable: true
#   ClientOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: client
#   PeerOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: peer
#   AdminOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: admin
#   OrdererOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgOrderer/Orderer1/msp/config.yaml
# { set +x; } 2>/dev/null

# mkdir -p ./Orderer2
# cp /home/huy/FabricNetwork/OrgOrderer/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgOrderer/Orderer2/tls-cert.pem
# export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/Orderer2
#   set -x
# fabric-ca-client enroll -u https://orderer2:orderer2pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Orderer2/msp --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Orderer2/tls-cert.pem
#  { set +x; } 2>/dev/null
# mv /home/huy/FabricNetwork/OrgOrderer/Orderer2/msp/keystore/* /home/huy/FabricNetwork/OrgOrderer/Orderer2/msp/keystore/server.key
#     set -x
# fabric-ca-client enroll -u https://orderer2:orderer2pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Orderer2/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Orderer2/tls-cert.pem
#   { set +x; } 2>/dev/null
# mv /home/huy/FabricNetwork/OrgOrderer/Orderer2/tls/keystore/* /home/huy/FabricNetwork/OrgOrderer/Orderer2/tls/keystore/server.key
# set -x
# echo 'NodeOUs:
#   Enable: true
#   ClientOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: client
#   PeerOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: peer
#   AdminOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: admin
#   OrdererOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgOrderer/Orderer2/msp/config.yaml
# { set +x; } 2>/dev/null

# mkdir -p ./Orderer3
# cp /home/huy/FabricNetwork/OrgOrderer/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgOrderer/Orderer3/tls-cert.pem
# export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/Orderer3
#   set -x
# fabric-ca-client enroll -u https://orderer3:orderer3pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Orderer3/msp --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Orderer3/tls-cert.pem
#  { set +x; } 2>/dev/null
# mv /home/huy/FabricNetwork/OrgOrderer/Orderer3/msp/keystore/* /home/huy/FabricNetwork/OrgOrderer/Orderer3/msp/keystore/server.key
#     set -x
# fabric-ca-client enroll -u https://orderer3:orderer3pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Orderer3/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Orderer3/tls-cert.pem
#   { set +x; } 2>/dev/null
# mv /home/huy/FabricNetwork/OrgOrderer/Orderer3/tls/keystore/* /home/huy/FabricNetwork/OrgOrderer/Orderer3/tls/keystore/server.key
# set -x
# echo 'NodeOUs:
#   Enable: true
#   ClientOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: client
#   PeerOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: peer
#   AdminOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: admin
#   OrdererOUIdentifier:
#     Certificate: cacerts/localhost-11054-ca-orderer.pem
#     OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgOrderer/Orderer3/msp/config.yaml
# { set +x; } 2>/dev/null




# export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin

# set -x
# fabric-ca-client register --caname ca-orderer --id.name Admin1Orgorderer --id.secret Admin1Orgorderer --id.type admin --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
#   { set +x; } 2>/dev/null

#   set -x
# fabric-ca-client register --caname ca-orderer --id.name Admin2Orgorderer --id.secret Admin2Orgorderer --id.type admin --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
#   { set +x; } 2>/dev/null


mkdir -p ./Admin1
cp /home/huy/FabricNetwork/OrgOrderer/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgOrderer/Admin1/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/Admin1
  set -x
fabric-ca-client enroll -u https://Admin1Orgorderer:Admin1Orgorderer@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Admin1/msp --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Admin1/tls-cert.pem
 { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgOrderer/Admin1/msp/keystore/* /home/huy/FabricNetwork/OrgOrderer/Admin1/msp/keystore/server.key
    set -x
fabric-ca-client enroll -u https://Admin1Orgorderer:Admin1Orgorderer@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Admin1/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Admin1/tls-cert.pem
  { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgOrderer/Admin1/tls/keystore/* /home/huy/FabricNetwork/OrgOrderer/Admin1/tls/keystore/server.key
set -x
echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-orderer.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-orderer.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-orderer.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-11054-ca-orderer.pem
    OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgOrderer/Admin1/msp/config.yaml
{ set +x; } 2>/dev/null


export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin
set -x
fabric-ca-client register --caname ca-orderer --id.name peer1 --id.secret peer1pw --id.type peer --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/bootstrapAdmin/tls-cert.pem
{ set +x; } 2>/dev/null
set -x
mkdir -p ./Peer1
cp /home/huy/FabricNetwork/OrgOrderer/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgOrderer/Peer1/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgOrderer/Peer1
{ set +x; } 2>/dev/null
set -x
fabric-ca-client enroll -u https://peer1:peer1pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Peer1/msp --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Peer1/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgOrderer/Peer1/msp/keystore/* /home/huy/FabricNetwork/OrgOrderer/Peer1/msp/keystore/server.key
set -x
fabric-ca-client enroll -u https://peer1:peer1pw@localhost:11054 --caname ca-orderer -M /home/huy/FabricNetwork/OrgOrderer/Peer1/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgOrderer/Peer1/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgOrderer/Peer1/tls/keystore/* /home/huy/FabricNetwork/OrgOrderer/Peer1/tls/keystore/server.key

set -x
cp /home/huy/FabricNetwork/OrgOrderer/Admin1/msp/config.yaml /home/huy/FabricNetwork/OrgOrderer/Peer1/msp/config.yaml
{ set +x; } 2>/dev/null