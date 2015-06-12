#!/bin/bash
set -euo pipefail

USERNAME=$1
PASSWORD=$2

# handle system registration
yum -y erase rh-amazon-rhui-client-2.2.118-1.el7.noarch
subscription-manager register --username="${USERNAME}" --password="${PASSWORD}"
subscription-manager attach --auto
subscription-manager repos --disable="*"
subscription-manager repos --enable="rhel-7-server-rpms" --enable="rhel-7-server-extras-rpms" --enable="rhel-7-server-optional-rpms" --enable="rhel-server-7-ose-beta-rpms"

# Install necessary components
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-beta
yum -y install deltarpm
yum -y install wget vim-enhanced net-tools bind-utils tmux git
yum -y update
yum -y install docker lvm2

# Handle docker storage setup
#echo <<EOF > /etc/sysconfig/docker-storage-setup
#VG=docker-vg
#SETUP_LVM_THIN_POOL=yes
#EOF
#docker-storage-setup

# Clean out loopback docker volume storage and restart docker
systemctl stop docker
rm -rf /var/lib/docker/*
systemctl start docker

# You'll need to add --insecure-registry 0.0.0.0/0 to your /etc/sysconfig/docker OPTIONS. Then:

systemctl start docker

docker pull registry.access.redhat.com/openshift3_beta/ose-haproxy-router:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/ose-deployer:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/ose-sti-builder:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/ose-sti-image-builder:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/ose-docker-builder:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/ose-pod:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/ose-docker-registry:v0.5.2.2
docker pull registry.access.redhat.com/openshift3_beta/sti-basicauthurl:latest
docker pull registry.access.redhat.com/openshift3_beta/ose-keepalived-ipfailover:v0.5.2.2

docker pull registry.access.redhat.com/openshift3_beta/ruby-20-rhel7
docker pull registry.access.redhat.com/openshift3_beta/mysql-55-rhel7
docker pull registry.access.redhat.com/jboss-eap-6/eap-openshift
docker pull openshift/hello-openshift:v0.4.3
