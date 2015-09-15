VAGRANTFILE_API_VERSION = "2"

# Debian box

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use the same key for each machine
  config.ssh.insert_key = false

  config.vm.define "web" do |vagrant1|
    vagrant1.vm.hostname = "web-server"
    vagrant1.vm.box = "debian/jessie64"
    vagrant1.vm.network "private_network", ip: "192.168.35.10"
  end
  config.vm.define "app" do |vagrant2|
    vagrant2.vm.hostname = "app-server"
    vagrant2.vm.box = "debian/jessie64"
    vagrant2.vm.network "private_network", ip: "192.168.35.11"
  end
  config.vm.define "db" do |vagrant3|
    vagrant3.vm.hostname = "db-server"
    vagrant3.vm.box = "debian/jessie64"
    vagrant3.vm.network "private_network", ip: "192.168.35.12"
  end
  config.vm.define "gitlab" do |vagrant4|
    vagrant4.vm.hostname = "gitlab-server"
    vagrant4.vm.box = "debian/jessie64"
    vagrant4.vm.network "private_network", ip: "192.168.35.13"
  end
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end
end
