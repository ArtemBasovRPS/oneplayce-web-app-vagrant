# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # Box
    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"

    # Sites
    config.vm.synced_folder "./sites", "/var/sites/default", 
    	:create => true, 
    	:mount_options => ["dmode=755", "fmode=644"]

    # Supress *stdin: is not a tty* warning
	config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    # Running common provision
    config.vm.provision "shell", path: "./provision/script.sh", keep_color: true

    # OnePlayce 
    # onfig.vm.provision "shell", path: "./provision/oneplayce.sh", keep_color: true

end
