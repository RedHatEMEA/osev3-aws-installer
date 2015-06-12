OSE3 beta 4 AWS Installer
=========================

This Vagrant File will setup a completely configured and ready to use OSEv3
Environment in Amazon AWS.

Create a File `variables.sh` with the following content:

```
export AWS_ACCESS_KEY="Your Access Key"
export AWS_SECRET_ACCESS_KEY="Your Secret Access Key"
export AWS_KEYPAIR_NAME="Your AWS keypair Name"

export AWS_AMI="ami-dafdcfc7"
export AWS_REGION="eu-central-1"

export SSH_PRIVATE_KEY_PATH="Full path to the .pem file for SSH connection"
export RHN_USER="Your RHN User"
export RHN_PASS="Your RHN Password"
```

and then `source` it via `source variables.sh`

After that, all you have to do is tu run vagrant up and Vagrant will provision
3 Machines 1 OSE Master and 2 OSE Nodes into AWS.
