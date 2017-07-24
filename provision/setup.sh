#!/bin/bash

# Seteamos el modo no interactivo de apt-get
export DEBIAN_FRONTEND=noninteractive

echo "Provisionando la máquina virtual..."

#Cambiando el hostname a la VM...
hostnamectl set-hostname so-2017
sed -i 's/localhost/localhost so-2017/g' /etc/hosts

echo "Actualizando lista de paquetes..."
# Actualizo la lista de paquetes
apt-get update > /dev/null

echo "Ajustando locales e idioma..."
# Ajusto el locale por default a es_AR
apt-get install language-pack-es > /dev/null
locale-gen es_ES es_AR es_AR.UTF-8 > /dev/null
echo 'LANG=es_AR.utf-8' > /etc/default/locale
echo 'LANGUAGE=es_AR.utf-8' >> /etc/default/locale
dpkg-reconfigure locales > /dev/null

echo "Instalando páginas man..."
# Instalo manuales en español
apt-get install manpages-es manpages-es-extra > /dev/null
# Instalo manuales utiles en las prácticas de la materia
apt-get install manpages-posix manpages-posix-dev manpages-dev > /dev/null

echo "Instalando Herramientas Básicas..."
# gpm para dar soporte al mouse en línea de comandos
# htop: un comando top mejorado
apt-get install gpm mc htop -y > /dev/null

echo "Descargando FreePascal 2.4.0..."
# Creamos un directorio para los archivos temporales
mkdir /tmp/fpc
cd /tmp/fpc
# Descargamos y descomprimimos FreePascal 2.4.0 32 bits
wget -q https://sourceforge.net/projects/freepascal/files/Linux/2.4.0/fpc-2.4.0.i386-linux.tar

echo "Instalando FreePascal 2.4.0..."
# Desempaquetamos FreePascal
tar xvf fpc-2.4.0.i386-linux.tar > /dev/null
# Instalamos...
./install.sh < /vagrant/provision/fpc/install_opts > /dev/null
cd
# Eliminamos archivos temporales
rm -rf /tmp/fpc
# Copiamos archivos de configuración de FreePascal IDE
cp /vagrant/provision/fpc/fp.* /home/vagrant/
chown vagrant.vagrant /home/vagrant/fp.*

# Forzamos el color en el prompt de la máquina virtual
sed -i 's/#force_color_prompt/force_color_prompt/g' /home/vagrant/.bashrc

# Actualizamos la base de datos de locate
updatedb

echo "Finalizadas las actividades de instalación y configuración!"
