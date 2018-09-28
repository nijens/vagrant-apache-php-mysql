# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Extend from Ubuntu Bionic (18.04)
  config.vm.box = "ubuntu/bionic64"

  # Add PHP version switcher
  config.vm.provision "file", source: "provision/binary/switch-php.sh", destination: "/tmp/switch-php"

  # Execute LAMP packages installation and configuration
  config.vm.provision "shell", path: "provision/base.sh"

  # Keep Vagrant insecure public key
  config.ssh.insert_key = false

  # Disable default serial port logging connection of Ubuntu box
  config.vm.provider 'virtualbox' do |vb|
    vb.customize [ 'modifyvm', :id, '--uartmode1', 'disconnected']
  end
end
