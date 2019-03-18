# -*- mode: ruby -*-
# vi: set ft=ruby :

require './Vagrant/config.rb'

# Install required vagrant plugins
required_plugins = %w( vagrant-vbguest vagrant-omnibus vagrant-hostmanager vagrant-docker-compose )
required_plugins.each do |plugin|
  exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = $VM_BOX

  # The hostname the machine should have. 
  # Defaults to nil. If nil, Vagrant will not manage the hostname. 
  # If set to a string, the hostname will be set on boot.
  # If set, Vagrant will update /etc/hosts on the guest with the configured hostname.
  #
  config.vm.hostname = $VM_HOST_NAME

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = $VM_CHECK_BOX_UPDATE

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  $VM_FORWARDED_PORTS.each do |port|
    config.vm.network 'forwarded_port', guest: port[:GUEST], host: port[:HOST], host_ip: '127.0.0.1'
  end  

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip: $VM_NETWORK_IP

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  $VM_SYNC_FOLDERS.each do |sync|
    config.vm.synced_folder sync[:HOST_PATH], sync[:GUEST_PATH], type: sync[:TYPE], linux__nfs_options: ['rw','no_subtree_check','all_squash','async']
  end

  # If true, agent forwarding over SSH connections is enabled. Defaults to false.
  config.ssh.forward_agent = $VM_FORWARD_SSH_AGENT

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider 'virtualbox' do |vb|
    # The display name at the GUI
    vb.name = $VM_NAME
    # Display the VirtualBox GUI when booting the machine
    vb.gui = $VM_SHOW_GUI
    # Customize the amount of memory on the VM:
    vb.memory = $VM_MEMORY
    # Customize the amount of CPUS to use by the VM:
    vb.cpus = $VM_CPUS
    # Use linked clones
    vb.linked_clone = $VM_LINKED_CLONE
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #     ln -s /vagrant_data/ ~/app
  # SHELL

  # hosts settings (host machine)
  config.vm.provision :hostmanager
  config.hostmanager.enabled            = true
  config.hostmanager.manage_host        = true
  config.hostmanager.ignore_private_ip  = false
  config.hostmanager.include_offline    = true
  config.hostmanager.aliases            = $VM_HOST_ALIASES.values

  # Docker and Docker-compose provision
  config.vm.provision :docker
  config.vm.provision :docker_compose

  # Upgrade to latest version
  config.vm.provision "shell", path: "./Vagrant/docker-upgrade.sh"
  config.vm.provision "shell", path: "./Vagrant/docker-run.sh"

  # A message to show after vagrant up. 
  # This will be shown to the user and is useful for containing instructions 
  # such as how to access various components of the development environment.
  #
  config.vm.post_up_message = $VM_POST_UP_MESSAGE
end