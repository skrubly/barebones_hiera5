
Vagrant.configure("2") do |config|
    config.vm.box = "trusty"

    config.vm.hostname = "p.example.com"
    apt_force = "--allow-downgrades --allow-remove-essential --allow-change-held-packages"
    apt_puppet_versions = "puppet-agent=5.3.3-1trusty"
    config.vm.provision "shell", :inline => <<-SHELL
        sudo gpg --keyserver pgp.mit.edu --recv-key 7F438280EF8D349F
        sudo gpg -a --export EF8D349F | apt-key add -
        sudo echo 'deb http://apt.puppetlabs.com trusty puppet5' > /etc/apt/sources.list.d/puppetlabs.list
        sudo bash -c 'echo "p.example.com" > /etc/hostname'
        sudo hostname "p.example.com"
        sudo apt-get update
        sudo apt-get install -y #{apt_puppet_versions}
    SHELL

    config.vm.provision "puppet" do |puppet|
        #puppet.options = '--verbose --debug'
        puppet.module_path = "modules"
        puppet.environment_path = "environments"
        puppet.environment = "default"
        puppet.hiera_config_path = "environments/default/hiera.yaml"
    end
end
