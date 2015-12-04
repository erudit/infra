# -*- mode: ruby -*-

# vi: set ft=ruby :

boxes = [
    {
        :name => "apache",
        :eth1 => "192.168.35.10",
        :mem => "512",
        :cpu => "1",
        :hostname => "apache-server"
    },
    {
        :name => "nginx",
        :eth1 => "192.168.35.11",
        :mem => "512",
        :cpu => "1",
        :hostname => "nginx-server"
    },
    {
        :name => "app",
        :eth1 => "192.168.35.12",
        :mem => "1024",
        :cpu => "1",
        :hostname => "app-server"
    },
    {
        :name => "db",
        :eth1 => "192.168.35.13",
        :mem => "512",
        :cpu => "1",
        :hostname => "db-server"
    },
    {
        :name => "gitlab",
        :eth1 => "192.168.35.14",
        :mem => "512",
        :cpu => "1",
        :hostname => "gitlab-server"
    },
    {
        :name => "odoo",
        :eth1 => "192.168.35.15",
        :mem => "512",
        :cpu => "1",
        :hostname => "odoo-server"
    },
    {
        :name => "redmine",
        :eth1 => "192.168.35.16",
        :mem => "512",
        :cpu => "1",
        :hostname => "redmine-server"
    },
    {
        :name => "monitoring",
        :eth1 => "192.168.35.17",
        :mem => "512",
        :cpu => "1",
        :hostname => "monitoring-server"
    },
]

Vagrant.configure(2) do |config|

  # Use the same key for each machine
  config.ssh.insert_key = false

  config.vm.box = "centos/7"

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:hostname]

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end

      config.vm.network :private_network, ip: opts[:eth1]
    end
  end
end
