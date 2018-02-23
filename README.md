# vagrant-apache-php-mysql
The configuration files used to create the [nijens/apache-php-mysql][link-vagrant-box] Vagrant base box.

# Usage
Execute the following commands inside your project to initialize the Vagrant Virtualbox image.
``` bash
vagrant init nijens/apache-php-mysql
vagrant up
```


## Configuring Apache for your project
To configure Apache and make it available for you to access you will require to add the following:
1. An Apache configuration file suitable for your project.
2. Create a port forward to be able to access Apache from your browser.

The following configuration links to an Apache configuration inside your project and creates a port forward:
``` ruby
Vagrant.configure("2") do |config|
    config.vm.box = "nijens/apache-php-mysql"
    
    config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    
    config.vm.provision "shell", inline: "sudo ln -s /vagrant/path/to/apache.conf /etc/apache/sites-enabled/apache.conf"
end
```

Make sure the document root of your Apache configuration is directed to `/vagrant`.


## Adding Elasticsearch to the Vagrant box of your project
Some projects require, besides a MySQL database, an Elasticsearch database to run. 
For this case a shell script is provided to easily add it to your box.

The following configuration shows how to add the script to your configuration and install Elasticsearch 2.x:
``` ruby
Vagrant.configure("2") do |config|
    # ...
    
    config.vm.provision "shell", 
        path: "https://raw.githubusercontent.com/nijens/vagrant-apache-php-mysql/master/provision/elasticsearch.sh", 
        sha1: 62c62971d8bea9c9e5e2bd444cd433804f7b79c8,
        args: ["2"]
    
    # ...
end
```
In the above example version 2.x of Elasticsearch is installed by adding `args: ["2"]`, but you can also install version 6.x by changing the version number.

For more information on configuration of your Vagrant box, see the [Vagrant documentation][link-vagrant-documentation].


[link-vagrant-box]: https://app.vagrantup.com/nijens/boxes/apache-php-mysql
[link-vagrant-documentation]: https://www.vagrantup.com/intro/getting-started/index.html
