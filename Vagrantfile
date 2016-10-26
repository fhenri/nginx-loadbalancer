# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"


  # Configure load balancer
  config.vm.define :load_balancer do |load_balancer_config|
    load_balancer_config.vm.host_name = "loadbalancer"
    load_balancer_config.vm.network :private_network, ip: "192.168.33.10"
    load_balancer_config.vm.provision "shell", path: "puppet/script/install-puppet-modules-lb.sh"
    load_balancer_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file = "base-lb.pp"
    end
  end

  app_servers = { 
    :node1 => '192.168.33.44',
    :node2 => '192.168.33.45'
  }

  app_servers.each do |node_server_name, node_server_ip|
    config.vm.define node_server_name do |node_config|
      node_config.vm.host_name = node_server_name.to_s
      node_config.vm.network :private_network, ip: node_server_ip
      node_config.vm.provision "shell", path: "puppet/script/install-puppet-modules-app.sh"
      node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "base-app.pp"
      end
    end
  end

end
