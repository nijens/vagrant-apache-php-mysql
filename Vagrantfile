# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Extend from Ubuntu Bionic (18.04)
  config.vm.box = "ubuntu/bionic64"

  # Add PHP version switcher
  config.vm.provision "file", source: "provision/binary/switch-php.sh", destination: "/tmp/switch-php"

  # Execute LAMP packages installation and configuration
  config.vm.provision "shell", path: "provision/base.sh"
end
