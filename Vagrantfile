# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
settings = YAML.load_file File.join(File.dirname(__FILE__), "puppet/hieradata/common.yaml")

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  app_servers = settings["app_servers"]
  app_servers.each do |node_server_name, node_server_ip|
    config.vm.define node_server_name do |node_config|
      node_config.vm.host_name = node_server_name.to_s
      node_config.vm.network :private_network, ip: node_server_ip
      node_config.vm.provision "shell", path: "puppet/script/install-puppet-modules-app.sh"
      node_config.vm.provision :puppet do |puppet|
        puppet.environment = "production"
        puppet.environment_path = "puppet/environments"
        puppet.manifests_path = "puppet/environments/production/manifests"
        puppet.manifest_file = "base-app.pp"
        #puppet.options = "--verbose --trace"
      end
      node_config.vm.provision "shell", path: "puppet/script/run-pm2.sh"

    end
  end

  # Configure load balancer
  config.vm.define :load_balancer do |load_balancer_config|
    load_balancer_config.vm.host_name = "loadbalancer"
    load_balancer_config.vm.network :private_network, ip: "192.168.33.10"
    load_balancer_config.vm.provision "shell", path: "puppet/script/install-puppet-modules-lb.sh"
    load_balancer_config.vm.provision :puppet do |puppet|
      puppet.environment = "production"
      puppet.environment_path = "puppet/environments"
      puppet.manifests_path = "puppet/environments/production/manifests"
      puppet.manifest_file = "base-lb.pp"
      puppet.hiera_config_path = "puppet/hiera.yaml"
      puppet.options = "--verbose --debug"
    end
  end

end
