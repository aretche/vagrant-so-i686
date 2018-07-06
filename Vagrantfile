# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Base box de la que partimos
  config.vm.box = "ubuntu/trusty32"

  # Configuramos que el subirectorio ./practicas en el host que esté mapeado en el home de la máquina virtual
  config.vm.synced_folder "./practicas", "/home/vagrant/practicas", create: true, group: "vagrant", owner: "vagrant"
  
  # Configuración específica para el provider virtualbox
  config.vm.provider "virtualbox" do |v|
      # Seteamos el nombre de la máquina virtual
      v.name = "S.O. 2018 (32 bits)"
      # Cambiamos la memoria dedicada a la máquina virtual
      v.customize ["modifyvm", :id, "--memory", "256"]
      # Activamos el portapapeles entre el host y la máquina virtual
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  # Configuranmos el provisioning mediante shell script
  config.vm.provision "shell" do |s|
      s.path = "provision/setup.sh"
  end

end
