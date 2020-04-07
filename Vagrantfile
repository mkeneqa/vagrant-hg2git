# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|  
    vb.gui = false
    vb.memory = "1024"
    vb.cpus = 1
  end

  # config.vm.network "forwarded_port", guest: 8000, host: 8000

  # map shared folders
  config.vm.synced_folder "./Hg2GitConvert" , "/home/vagrant/Hg2GitConvert",:nfs => { :mount_options => ["dmode=777","fmode=666"] }
  
  # copy file from host to guest
  # config.vm.provision "file",source:"./Hg2GitConvert/hg2gitconvert.sh",destination:"$HOME/hg2gitconvert.sh"

  config.vm.provision "shell", path: "./setup.sh"

end