VAGRANTFILE_API_VERSION = "2"

# Ubuntu box

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use the same key for each machine
  config.ssh.insert_key = false

  config.vm.define "web" do |vagrant1|
    vagrant1.vm.box = "ubuntu/vivid64"
    vagrant1.vm.network "private_network", ip: "192.168.35.10"
  end
  config.vm.define "app" do |vagrant2|
    vagrant2.vm.box = "ubuntu/vivid64"
    vagrant2.vm.network "private_network", ip: "192.168.35.11"
  end
  config.vm.define "db" do |vagrant3|
    vagrant3.vm.box = "ubuntu/vivid64"
    vagrant3.vm.network "private_network", ip: "192.168.35.12"
  end
  config.vm.provider "vitrualbox" do |vb|
    vb.memory = "512"
  end
end
