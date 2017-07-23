# vagrant-so-i686

Versión de 32 bits de la máquina virtual Vagrant de la cátedra Sistemas Operativos.
La misma consta de un Ubuntu 14.04 (Trusty Thar) con las herramientas necesarias para llevar a cabo las actividades prácticas de la cátedra.

La versión de 64 bits de esta máquina virtual se encuentra disponible [aquí](https://github.com/aretche/vagrant-so).

## Requisitos previos

Tener instalado:
1. [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. [Git](https://git-scm.com/downloads)
3. [Vagrant](https://www.vagrantup.com/downloads.html)


## Instalación

Clonar el repositorio usando Git mediante el comando:

`git clone https://github.com/aretche/vagrant-so-i686.git`

Alternativamente puede descargar el repositorio como un archivo .zip desde [aquí](https://github.com/aretche/vagrant-so-i686/archive/2017.07.zip) y descomprimirlo en su computadora.

Dentro del directorio donde clonó el repositorio (o descomprimió el archivo descargado) ejecutar el comando:

`vagrant up --provider=virtualbox`

Tenga paciencia, ya que este comando descargará e instalará todas las herramientas (la primera ejecución serán unos 600 MB).

## Uso

Ingresar a la máquina virtual usando:

`vagrant ssh`


### Archivos compartidos

Dentro de su directorio home se encuentra la carpeta `practicas` que está mapeada con la carpeta de igual nombre en el directorio `vagrant-so` del host, por lo cual, los archivos que se copien ahí serán visibles tanto por la máquina virtual como por la computadora host.

### Otros comandos de utilidad

Para ver el estado de la máquina virtual:

`vagrant status`

Para pausar/reactivar la máquina virtual utilizar:

`vagrant suspend`

`vagrant resume`

Para apagar/encender la máquina virtual:

`vagrant halt`

`vagrant up`

Para eliminar la máquina virtual (se conservan los archivos de la carpeta `practicas`):

`vagrant destroy`

## En Windows

En el caso de Windows, Git for Windows incluye un cliente SSH (asegúrese que el archivo ssh.exe esté incluido en la variable de entorno PATH).
Para que el comando SSH quede en el PATH, durante la instalación de Git en la pantalla que dice *"Adjusting your PATH environment"* seleccione la tercera opción *"Use Git and optional Unix tools from the Windows Command Prompt"*.

Si no está conforme con ese cliente, puede instalar [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html).
