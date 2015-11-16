# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "pussinboots/ubuntu-truly-jdk8"
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=755","fmode=755"]
  config.vm.provision :shell, :path => "provision/provision_many.sh", :args => ["git-core"], run: "always"
  config.vm.provision :shell, :path => "provision/compile.sh", run: "always"

  config.vm.provider :virtualbox do |vb|
	vb.gui = true
	vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
	vb.customize ["modifyvm", :id, "--vram", "128"]
	vb.customize ["modifyvm", :id, "--graphicscontroller", "vboxvga"]
	vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
	vb.customize ["modifyvm", :id, "--ioapic", "on"]
	vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
	vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
	vb.memory = 512
	vb.cpus = 2
  end
end
