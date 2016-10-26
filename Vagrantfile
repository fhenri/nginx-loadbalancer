# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  #config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"


  # Configure load balancer
  config.vm.define :load_balancer do |load_balancer_config|
    load_balancer_config.vm.host_name = "loadbalancer"
    load_balancer_config.vm.network :private_network, ip: "192.168.33.10"
    load_balancer_config.vm.provision "shell", path: "puppet/script/install-puppet-modules.sh"
    load_balancer_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "base.pp"
      #puppet.options = "--verbose --trace"
    end
  end

  app_servers = { :app1 => '192.168.33.44',
                  :app2 => '192.168.33.45'
                }

  app_servers.each do |app_server_name, app_server_ip|
    config.vm.define app_server_name do |app_config|
      app_config.vm.host_name = app_server_name.to_s
      app_config.vm.network :private_network, ip: app_server_ip
      app_config.vm.provision "shell", path: "puppet/script/install-puppet-modules.sh"
      app_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "base.pp"
      end
    end
  end

end
