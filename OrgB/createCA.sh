export PATH=/home/huy/FabricNetwork/OrgB/bin:$PATH
echo "Enrolling the CA admin"
mkdir -p ./bootstrapAdmin  
cp /home/huy/FabricNetwork/OrgB/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgB/bootstrapAdmin/tls-cert.pem

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgB/bootstrapAdmin
  set -x
fabric-ca-client enroll -u https://admin:adminpw@localhost:8054 --caname ca-orgB --tls.certfiles /home/huy/FabricNetwork/OrgB/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
  set -x
fabric-ca-client register --caname ca-orgB --id.name orgBadmin --id.secret orgBadminpw --id.type admin --tls.certfiles /home/huy/FabricNetwork/OrgB/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
mkdir -p ./Admin
cp /home/huy/FabricNetwork/OrgB/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgB/Admin/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgB/Admin
  set -x
fabric-ca-client enroll -u https://orgBadmin:orgBadminpw@localhost:8054 --caname ca-orgB -M /home/huy/FabricNetwork/OrgB/Admin/msp --tls.certfiles /home/huy/FabricNetwork/OrgB/Admin/tls-cert.pem
 { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgB/Admin/msp/keystore/* /home/huy/FabricNetwork/OrgB/Admin/msp/keystore/server.key
    set -x
fabric-ca-client enroll -u https://orgBadmin:orgBadminpw@localhost:8054 --caname ca-orgB -M /home/huy/FabricNetwork/OrgB/Admin/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgB/Admin/tls-cert.pem
  { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgB/Admin/tls/keystore/* /home/huy/FabricNetwork/OrgB/Admin/tls/keystore/server.key
set -x
echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-orgB.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-orgB.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-orgB.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-8054-ca-orgB.pem
    OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgB/Admin/msp/config.yaml
{ set +x; } 2>/dev/null

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgB/bootstrapAdmin
# set -x
# fabric-ca-client register --caname ca-orgB --id.name peer --id.secret peerpw --id.type peer --tls.certfiles /home/huy/FabricNetwork/OrgB/bootstrapAdmin/tls-cert.pem
# { set +x; } 2>/dev/null
set -x
mkdir -p ./Peer
cp /home/huy/FabricNetwork/OrgB/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgB/Peer/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgB/Peer
{ set +x; } 2>/dev/null
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:8054 --caname ca-orgB -M /home/huy/FabricNetwork/OrgB/Peer/msp --tls.certfiles /home/huy/FabricNetwork/OrgB/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgB/Peer/msp/keystore/* /home/huy/FabricNetwork/OrgB/Peer/msp/keystore/server.key
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:8054 --caname ca-orgB -M /home/huy/FabricNetwork/OrgB/Peer/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgB/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgB/Peer/tls/keystore/* /home/huy/FabricNetwork/OrgB/Peer/tls/keystore/server.key

set -x
cp /home/huy/FabricNetwork/OrgB/Admin/msp/config.yaml /home/huy/FabricNetwork/OrgB/Peer/msp/config.yaml
{ set +x; } 2>/dev/null
