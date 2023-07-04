export PATH=/home/huy/FabricNetwork/OrgC/bin:$PATH
echo "Enrolling the CA admin"
mkdir -p ./bootstrapAdmin  
cp /home/huy/FabricNetwork/OrgC/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgC/bootstrapAdmin/tls-cert.pem

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgC/bootstrapAdmin
  set -x
fabric-ca-client enroll -u https://admin:adminpw@localhost:9054 --caname ca-orgC --tls.certfiles /home/huy/FabricNetwork/OrgC/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
  set -x
fabric-ca-client register --caname ca-orgC --id.name orgCadmin --id.secret orgCadminpw --id.type admin --tls.certfiles /home/huy/FabricNetwork/OrgC/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
mkdir -p ./Admin
cp /home/huy/FabricNetwork/OrgC/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgC/Admin/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgC/Admin
  set -x
fabric-ca-client enroll -u https://orgCadmin:orgCadminpw@localhost:9054 --caname ca-orgC -M /home/huy/FabricNetwork/OrgC/Admin/msp --tls.certfiles /home/huy/FabricNetwork/OrgC/Admin/tls-cert.pem
 { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgC/Admin/msp/keystore/* /home/huy/FabricNetwork/OrgC/Admin/msp/keystore/server.key
    set -x
fabric-ca-client enroll -u https://orgCadmin:orgCadminpw@localhost:9054 --caname ca-orgC -M /home/huy/FabricNetwork/OrgC/Admin/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgC/Admin/tls-cert.pem
  { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgC/Admin/tls/keystore/* /home/huy/FabricNetwork/OrgC/Admin/tls/keystore/server.key
set -x
echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-orgC.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-orgC.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-orgC.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-9054-ca-orgC.pem
    OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgC/Admin/msp/config.yaml
{ set +x; } 2>/dev/null

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgC/bootstrapAdmin
set -x
fabric-ca-client register --caname ca-orgC --id.name peer --id.secret peerpw --id.type peer --tls.certfiles /home/huy/FabricNetwork/OrgC/bootstrapAdmin/tls-cert.pem
{ set +x; } 2>/dev/null
set -x
mkdir -p ./Peer
cp /home/huy/FabricNetwork/OrgC/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgC/Peer/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgC/Peer
{ set +x; } 2>/dev/null
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:9054 --caname ca-orgC -M /home/huy/FabricNetwork/OrgC/Peer/msp --tls.certfiles /home/huy/FabricNetwork/OrgC/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgC/Peer/msp/keystore/* /home/huy/FabricNetwork/OrgC/Peer/msp/keystore/server.key
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:9054 --caname ca-orgC -M /home/huy/FabricNetwork/OrgC/Peer/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgC/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgC/Peer/tls/keystore/* /home/huy/FabricNetwork/OrgC/Peer/tls/keystore/server.key

set -x
cp /home/huy/FabricNetwork/OrgC/Admin/msp/config.yaml /home/huy/FabricNetwork/OrgC/Peer/msp/config.yaml
{ set +x; } 2>/dev/null
