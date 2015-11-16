# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = false

    config.vm.define 'oneplayce-web-app' do |node|
        # Box
        node.vm.box = "scotch/box"
        node.vm.network "private_network", ip: "192.168.33.10"

        # Sites
        node.vm.synced_folder "./sites", "/var/sites", 
            :create => true, 
            :mount_options => ["dmode=755", "fmode=644"]

        # Supress *stdin: is not a tty* warning
        node.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

        # Running common provision
        node.vm.provision "shell", path: "./provision/script.sh", keep_color: true

        # OnePlayce 
        node.vm.provision "shell", path: "./provision/oneplayce.sh", keep_color: true
        
        # Setup aliases
         node.hostmanager.aliases = %w(oneplayce.le)
    end
end
