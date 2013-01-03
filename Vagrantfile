    # -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.define :devbox do |devbox_config|
        devbox_config.vm.box = "precise64"
        devbox_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
        
        devbox_config.vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        devbox_config.ssh.max_tries = 10

        config.vm.network :hostonly, "11.11.11.11"
        devbox_config.vm.host_name = "dev"
        # devbox_config.vm.forward_port 80, 8888
        # devbox_config.vm.forward_port 3306, 8889
  		
        devbox_config.vm.share_folder("www", "/var/www", "../web", :nfs => true, :extra => 'dmode=777,fmode=777')

  		devbox_config.vm.provision :shell, :inline => "echo \"Europe/Paris\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"

        devbox_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "base.pp"
            puppet.module_path = "puppet/modules"
            # puppet.options = "--verbose --debug"
            # puppet.options = "--verbose"
        end

        # devbox_config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"
    end
end
