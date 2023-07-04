export PATH=/home/huy/FabricNetwork/OrgD/bin:$PATH
echo "Enrolling the CA admin"
mkdir -p ./bootstrapAdmin  
cp /home/huy/FabricNetwork/OrgD/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgD/bootstrapAdmin/tls-cert.pem

export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgD/bootstrapAdmin
  set -x
fabric-ca-client enroll -u https://admin:adminpw@localhost:10054 --caname ca-orgD --tls.certfiles /home/huy/FabricNetwork/OrgD/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
  set -x
fabric-ca-client register --caname ca-orgD --id.name orgDadmin --id.secret orgDadminpw --id.type admin --tls.certfiles /home/huy/FabricNetwork/OrgD/bootstrapAdmin/tls-cert.pem
  { set +x; } 2>/dev/null
mkdir -p ./Admin
cp /home/huy/FabricNetwork/OrgD/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgD/Admin/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgD/Admin
  set -x
fabric-ca-client enroll -u https://orgDadmin:orgDadminpw@localhost:10054 --caname ca-orgD -M /home/huy/FabricNetwork/OrgD/Admin/msp --tls.certfiles /home/huy/FabricNetwork/OrgD/Admin/tls-cert.pem
 { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgD/Admin/msp/keystore/* /home/huy/FabricNetwork/OrgD/Admin/msp/keystore/server.key
    set -x
fabric-ca-client enroll -u https://orgDadmin:orgDadminpw@localhost:10054 --caname ca-orgD -M /home/huy/FabricNetwork/OrgD/Admin/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgD/Admin/tls-cert.pem
  { set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgD/Admin/tls/keystore/* /home/huy/FabricNetwork/OrgD/Admin/tls/keystore/server.key
set -x
echo 'NodeOUs:
  Enable: true
  ClientOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-orgD.pem
    OrganizationalUnitIdentifier: client
  PeerOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-orgD.pem
    OrganizationalUnitIdentifier: peer
  AdminOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-orgD.pem
    OrganizationalUnitIdentifier: admin
  OrdererOUIdentifier:
    Certificate: cacerts/localhost-10054-ca-orgD.pem
    OrganizationalUnitIdentifier: orderer' > /home/huy/FabricNetwork/OrgD/Admin/msp/config.yaml
{ set +x; } 2>/dev/null


export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgD/bootstrapAdmin
set -x
fabric-ca-client register --caname ca-orgD --id.name peer --id.secret peerpw --id.type peer --tls.certfiles /home/huy/FabricNetwork/OrgD/bootstrapAdmin/tls-cert.pem
{ set +x; } 2>/dev/null
set -x
mkdir -p ./Peer
cp /home/huy/FabricNetwork/OrgD/CA-server/tls-cert.pem /home/huy/FabricNetwork/OrgD/Peer/tls-cert.pem
export FABRIC_CA_CLIENT_HOME=/home/huy/FabricNetwork/OrgD/Peer
{ set +x; } 2>/dev/null
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:10054 --caname ca-orgD -M /home/huy/FabricNetwork/OrgD/Peer/msp --tls.certfiles /home/huy/FabricNetwork/OrgD/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgD/Peer/msp/keystore/* /home/huy/FabricNetwork/OrgD/Peer/msp/keystore/server.key
set -x
fabric-ca-client enroll -u https://peer:peerpw@localhost:10054 --caname ca-orgD -M /home/huy/FabricNetwork/OrgD/Peer/tls --enrollment.profile tls --csr.hosts localhost --tls.certfiles /home/huy/FabricNetwork/OrgD/Peer/tls-cert.pem
{ set +x; } 2>/dev/null
mv /home/huy/FabricNetwork/OrgD/Peer/tls/keystore/* /home/huy/FabricNetwork/OrgD/Peer/tls/keystore/server.key

set -x
cp /home/huy/FabricNetwork/OrgD/Admin/msp/config.yaml /home/huy/FabricNetwork/OrgD/Peer/msp/config.yaml
{ set +x; } 2>/dev/null