# Every Vagrant development environment requires a box. You can search for
# boxes at https://vagrantcloud.com/search.
#
$VM_BOX = 'generic/debian9'

# Starts the Docker deamon on vagrant up
$AUTOSTART_DOCKER   = true

# Rebuilds the docker images
$DOCKER_ARGUMENTS   = "--build"

# Provider-specific configuration so you can fine-tune various
# backing providers for Vagrant. These expose provider-specific options.
# Example for VirtualBox:
#
# The display name at the GUI
$VM_NAME            = 'dev_env_docker'

# The VM Hostname
$VM_HOST_NAME       = 'dev.docker'
# The VM Host Aliases
$VM_HOST_ALIASES    = {
    symfony:    'symfony.docker',
    yii:        'yii.docker'
}

# Display the VirtualBox GUI when booting the machine
$VM_SHOW_GUI    = false

# Customize the amount of memory on the VM:
$VM_MEMORY      = 2048

# Customize the amount of CPUS to use by the VM:
$VM_CPUS        = 2

# By default new machines are created by importing the base box. 
# For large boxes this produces a large overhead in terms of time (the import operation) 
# and space (the new machine contains a copy of the base box's image). 
# Using linked clones can drastically reduce this overhead.
#
# Linked clones are based on a master VM, which is generated by importing the 
# base box only once the first time it is required. 
# For the linked clones only differencing disk images are created where the parent disk image belongs to the master VM.
$VM_LINKED_CLONE = true

# Disable automatic box update checking. If you disable this, then
# boxes will only be checked for updates when the user runs
# `vagrant box outdated`. This is not recommended.
#
$VM_CHECK_BOX_UPDATE    = false

# Create a private network, which allows host-only access to the machine
# using a specific IP.
#
$VM_NETWORK_IP          = '10.0.0.10'

# If true, agent forwarding over SSH connections is enabled. Defaults to false.
#
$VM_FORWARD_SSH_AGENT   = true

# Create a forwarded port mapping which allows access to a specific port
# within the machine from a port on the host machine and only allow access
# via 127.0.0.1 to disable public access
#
$VM_FORWARDED_PORTS = [
    { :GUEST => 80,     :HOST => 8080 }
]

# Share an additional folder to the guest VM. The first argument is
# the path on the host to the actual folder. The second argument is
# the path on the guest to mount the folder. And the optional third
# argument is a set of non-required options.
#
$VM_SYNC_FOLDERS = [
    #, #linux__nfs_options: ['rw','no_subtree_check','all_squash','async']
    { :HOST_PATH => ".", :GUEST_PATH => "/vagrant_data", :TYPE => "nfs", :OPTIONS => ["rw", "vers=3", "tcp", "nolock"] }
]


# Some startup messages
$domainMsg = $VM_HOST_ALIASES.map{|k,v| " - #{k}                - http://#{v}"}.join("\n")

$VM_POST_UP_MESSAGE = <<MSG
------------------------------------------------------------------------------------------------------------
Machine #{$VM_NAME} is up and running

URLS:
 - WebApp               - http://#{$VM_HOST_NAME}
 - PHP Info             - http://#{$VM_HOST_NAME}/info.php
#{$domainMsg}
------------------------------------------------------------------------------------------------------------
MSG