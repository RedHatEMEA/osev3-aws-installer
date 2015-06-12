
AWS_ACCESS_KEY=ENV['AWS_ACCESS_KEY']
AWS_SECRET_ACCESS_KEY=ENV['AWS_SECRET_ACCESS_KEY']
AWS_KEYPAIR_NAME=ENV['AWS_KEYPAIR_NAME']

AWS_AMI=ENV['AWS_AMI'] || "ami-dafdcfc7"
AWS_REGION=ENV['AWS_REGION'] || "eu-central-1"

SSH_PRIVATE_KEY_PATH=ENV['SSH_PRIVATE_KEY_PATH'] || "~/.ssh/id_rsa"
RHN_USER=ENV['RHN_USER']
RHN_PASS=ENV['RHN_PASS']

Vagrant.configure("2") do |config|
  config.vm.box = "dummy"

  config.vm.provision "shell", path: "prepare_machine.sh", args: ["#{RHN_USER}", "#{RHN_PASS}"]

  config.vm.define "master" do |master|
      master.vm.box = "dummy"
      master.vm.provider :aws do |aws, override|
        aws.access_key_id = AWS_ACCESS_KEY
        aws.secret_access_key = AWS_SECRET_ACCESS_KEY
        aws.keypair_name = AWS_KEYPAIR_NAME

        aws.ami = AWS_AMI
        aws.region = AWS_REGION

        override.ssh.username = "ec2-user"
        override.ssh.private_key_path = SSH_PRIVATE_KEY_PATH

        aws.tags = {
          'Name' => 'OSE3 Master'
        }

        # Making sure that the ec2-user does not require a tty because that makes vagrant fail durint setup of the VM
        aws.user_data = "#!/bin/bash\necho 'Defaults:ec2-user !requiretty' > /etc/sudoers.d/999-vagrant-cloud-init-requiretty && #!/bin/bash\necho 'Defaults:root !requiretty' >> /etc/sudoers.d/999-vagrant-cloud-init-requiretty && chmod 440 /etc/sudoers.d/999-vagrant-cloud-init-requiretty \n"
    end

    master.vm.provision "shell", path: "prepare_master.sh"
  end

  config.vm.define "node-1" do |node1|
      node1.vm.box = "dummy"
      node1.vm.provider :aws do |aws, override|
        aws.access_key_id = AWS_ACCESS_KEY
        aws.secret_access_key = AWS_SECRET_ACCESS_KEY
        aws.keypair_name = AWS_KEYPAIR_NAME

        aws.ami = AWS_AMI
        aws.region = AWS_REGION

        override.ssh.username = "ec2-user"
        override.ssh.private_key_path = SSH_PRIVATE_KEY_PATH

        aws.tags = {
          'Name' => 'OSE3 Node 1'
        }

        # Making sure that the ec2-user does not require a tty because that makes vagrant fail durint setup of the VM
        aws.user_data = "#!/bin/bash\necho 'Defaults:ec2-user !requiretty' > /etc/sudoers.d/999-vagrant-cloud-init-requiretty && #!/bin/bash\necho 'Defaults:root !requiretty' >> /etc/sudoers.d/999-vagrant-cloud-init-requiretty && chmod 440 /etc/sudoers.d/999-vagrant-cloud-init-requiretty \n"

    end
  end

  config.vm.define "node-2" do |node2|
      node2.vm.box = "dummy"
      node2.vm.provider :aws do |aws, override|
        aws.access_key_id = AWS_ACCESS_KEY
        aws.secret_access_key = AWS_SECRET_ACCESS_KEY
        aws.keypair_name = AWS_KEYPAIR_NAME

        aws.ami = AWS_AMI
        aws.region = AWS_REGION

        override.ssh.username = "ec2-user"
        override.ssh.private_key_path = SSH_PRIVATE_KEY_PATH

        aws.tags = {
          'Name' => 'OSE3 Node 2'
        }

        # Making sure that the ec2-user does not require a tty because that makes vagrant fail durint setup of the VM
        aws.user_data = "#!/bin/bash\necho 'Defaults:ec2-user !requiretty' > /etc/sudoers.d/999-vagrant-cloud-init-requiretty && #!/bin/bash\necho 'Defaults:root !requiretty' >> /etc/sudoers.d/999-vagrant-cloud-init-requiretty && chmod 440 /etc/sudoers.d/999-vagrant-cloud-init-requiretty \n"

    end
  end
end
