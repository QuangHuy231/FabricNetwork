export PATH=/home/huy/FabricNetwork/OrgA/bin:$PATH
echo "Enrolling the CA admin"
mkdir -p ./bootstrapAdmin  
cp /home/huy/FabricNetwork/OrgA/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgA/bootstrapAdmin/tls-cert.pem

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgA/bootstrapAdmin
set -x
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054 --caname ca-orgA --tls.certfiles /home/huy/FabricNetwork/OrgA/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
set -x
fabric-ca-client register --caname ca-orgA --id.name orgAadmin --id.secret orgAadminpw --id.type admin --tls.certfiles /home/huy/FabricNetwork/OrgA/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
mkdir -p ./Admin
cp /home/huy/FabricNetwork/OrgA/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgA/Admin/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgA/Admin
set -x
fabric-ca-client enroll -u https://orgAadmin:orgAadminpw@localhost:7054 --caname ca-orgA -M /home/huy/FabricNetwork/OrgA/Admin/msp --tls.certfiles /home/huy/FabricNetwork/OrgA/Admin/tls-cert.pem
  { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgA/Admin/msp/keystore/* /home/huy/FabricNetwork/OrgA/Admin/msp/keystore/server.key
set -x
fabric-ca-client enroll -u https://orgAadmin:orgAadminpw@localhost:7054 --caname ca-orgA -M /home/huy/FabricNetwork/OrgA/Admin/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgA/Admin/tls-cert.pem
  { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgA/Admin/tls/keystore/* /home/huy/FabricNetwork/OrgA/Admin/tls/keystore/server.key
set -x
echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-orgA.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-orgA.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-orgA.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-7054-ca-orgA.pem
    OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgA/Admin/msp/config.yaml

  { set +x; } 2>/dev/null  

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgA/bootstrapAdmin
set -x
fabric-ca-client register --caname ca-orgA --id.name peer --id.secret peerpw --id.type peer --tls.certfiles /home/huy/FabricNetwork/OrgA/bootstrapAdmin/tls-cert.pem
{ set +x; } 2>/dev/null
set -x
mkdir -p ./Peer
cp /home/huy/FabricNetwork/OrgA/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgA/Peer/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgA/Peer
{ set +x; } 2>/dev/null
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:7054 --caname ca-orgA -M /home/huy/FabricNetwork/OrgA/Peer/msp --tls.certfiles /home/huy/FabricNetwork/OrgA/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgA/Peer/msp/keystore/* /home/huy/FabricNetwork/OrgA/Peer/msp/keystore/server.key
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:7054 --caname ca-orgA -M /home/huy/FabricNetwork/OrgA/Peer/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgA/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgA/Peer/tls/keystore/* /home/huy/FabricNetwork/OrgA/Peer/tls/keystore/server.key

set -x
cp /home/huy/FabricNetwork/OrgA/Admin/msp/config.yaml /home/huy/FabricNetwork/OrgA/Peer/msp/config.yaml
{ set +x; } 2>/dev/null