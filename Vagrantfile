VAGRANTFILE_API_VERSION = "2"

# Debian box

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use the same key for each machine
  config.ssh.insert_key = false

  config.vm.define "web1" do |vagrant1|
    vagrant1.vm.hostname = "web1-server"
    vagrant1.vm.box = "debian/jessie64"
    vagrant1.vm.network "private_network", ip: "192.168.35.10"
  end
  config.vm.define "web2" do |vagrant2|
    vagrant2.vm.hostname = "web2-server"
    vagrant2.vm.box = "debian/jessie64"
    vagrant2.vm.network "private_network", ip: "192.168.35.11"
  end
  config.vm.define "app" do |vagrant3|
    vagrant3.vm.hostname = "app-server"
    vagrant3.vm.box = "debian/jessie64"
    vagrant3.vm.network "private_network", ip: "192.168.35.12"
  end
  config.vm.define "db" do |vagrant4|
    vagrant4.vm.hos45tname = "db-server"
    vagrant4.vm.box = "debian/jessie64"
    vagrant4.vm.network "private_network", ip: "192.168.35.13"
  end
  config.vm.define "gitlab" do |vagrant5|
    vagrant5.vm.hostname = "gitlab-server"
    vagrant5.vm.box = "debian/jessie64"
    vagrant5.vm.network "private_network", ip: "192.168.35.14"
  end
  config.vm.define "odoo" do |vagrant6|
    vagrant6.vm.hostname = "odoo6-server"
    vagrant6.vm.box = "debian/jessie64"
    vagrant6.vm.network "private_network", ip: "192.168.35.15"
  end
  config.vm.define "redmine" do |vagrant7|
    vagrant7.vm.hostname = "redmine-server"
    vagrant7.vm.box = "debian/jessie64"
    vagrant7.vm.network "private_network", ip: "192.168.35.16"
  end
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end
end
