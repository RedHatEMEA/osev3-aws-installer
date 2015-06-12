#!/bin/bash
set -euo pipefail

# On your master, it makes sense to clone the training git repository
cd
git clone https://github.com/openshift/training.git

# In the "real world" your developers would likely be using the OpenShift tools
# on their own machines (osc and the web console). For the Beta training, we
# will create user accounts for two non-privileged users of OpenShift, joe and
# alice, on the master. This is done for convenience and because we'll be using
# htpasswd for authentication.
useradd joe
useradd alice

# Install EPEL
yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

# Disable EPEL so that it is not accidentally used later
sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo

# Install Ansible
yum -y --enablerepo=epel install ansible

#ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
#chmod 0600 /root/.ssh/id_rsa

#for host in ose3-master.example.com ose3-node1.example.com ose3-node2.example.com; do
#  ssh-copy-id -i ~/.ssh/id_rsa.pub $host
#done
