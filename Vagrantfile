# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # router1 setup
  config.vm.define :"rt-1" do |router|
    router.vm.box = "higebu/vyos"
    router.vm.hostname = "router1"
    # VM memory setting
    router.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    router.vm.network "private_network", ip: "10.10.0.20", netmask: "255.255.255.0", virtualbox__intnet: "MGNET"
    router.vm.network "private_network", ip: "192.168.10.10", netmask: "255.255.255.0", virtualbox__intnet: "INTER1"
    # set tmux config
    router.vm.provision "file", source: ".tmux.conf", destination: "./"
    router.vm.provision "file", source: "script/rt-1", destination: "./"
  end

  # router2 setup
  config.vm.define :"rt-2" do |router|
    router.vm.box = "higebu/vyos"
    router.vm.hostname = "router2"
    # VM memory setting
    router.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    router.vm.network "private_network", ip: "10.10.0.30", netmask: "255.255.255.0", virtualbox__intnet: "MGNET"
    router.vm.network "private_network", ip: "192.168.10.20", netmask: "255.255.255.0", virtualbox__intnet: "INTER1"
    router.vm.network "private_network", ip: "192.168.20.10", netmask: "255.255.255.0", virtualbox__intnet: "INTER2"
    # set tmux config
    router.vm.provision "file", source: ".tmux.conf", destination: "./"
    router.vm.provision "file", source: "script/rt-2", destination: "./"
  end

  # router3 setup
  config.vm.define :"rt-3" do |router|
    router.vm.box = "higebu/vyos"
    router.vm.hostname = "router3"
    # VM memory setting
    router.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end
    router.vm.network "private_network", ip: "10.10.0.40", netmask: "255.255.255.0", virtualbox__intnet: "MGNET"
    router.vm.network "private_network", ip: "192.168.20.20", netmask: "255.255.255.0", virtualbox__intnet: "INTER2"
    # set tmux config
    router.vm.provision "file", source: ".tmux.conf", destination: "./"
    router.vm.provision "file", source: "script/rt-3", destination: "./"
  end

  # service server setup
  config.vm.define :"mg" do |server|
    server.vm.box = "bento/ubuntu-18.04"
    server.vm.hostname = "server"
    server.vm.network :forwarded_port, guest: 80, host: 4567
    server.vm.network "private_network", ip: "10.10.0.10", netmask: "255.255.255.0", virtualbox__intnet: "MGNET"

    # ansible install
    server.vm.provision "shell", privileged: true, path: "./script/install.sh"

    # fingerprint auto add
    server.vm.provision "shell", inline:<<-SHELL
      ssh-keyscan -T 10 10.10.0.20 >> .ssh/known_hosts
      ssh-keyscan -T 10 10.10.0.30 >> .ssh/known_hosts
      ssh-keyscan -T 10 10.10.0.40 >> .ssh/known_hosts
    SHELL

    # VM setting
    server.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "4096"
      vb.cpus = "2"
    end

    # provsion docker
    server.vm.provision "docker"
    # provision docker-compose
    server.vm.provision "docker_compose"

    # copy playbooks
    server.vm.provision "file", source: "playbooks", destination: "./"
    server.vm.provision "file", source: ".tmux.conf", destination: "./"
  end

end
