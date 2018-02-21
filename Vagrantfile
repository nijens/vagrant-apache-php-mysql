# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Extend from Ubuntu Xenial (16.04)
  config.vm.box = "ubuntu/xenial64"

  # Execute LAMP packages installation and configuration
  config.vm.provision "shell", path: "provision.sh"
end
