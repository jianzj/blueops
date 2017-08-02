#!/bin/bash
ETCD_NODE=$1

# Generate ETCD cert and private key
/opt/kubernetes/ca/bin/cfssl gencert -ca=/opt/kubernetes/ca/ssl/ca.pem \
	-ca-key=/opt/kubernetes/ca/ssl/ca-key.pem -config=/opt/kubernetes/ca/ssl/ca-config.json \
	-profile=kubernetes /opt/kubernetes/etcd/ssl/$ETCD_NODE-csr.json | /opt/kubernetes/ca/bin/cfssljson -bare etcd

mv etcd-key.pem /opt/kubernetes/etcd/ssl/$ETCD_NODE-key.pem
mv etcd.pem /opt/kubernetes/etcd/ssl/$ETCD_NODE.pem
rm etcd.csr
