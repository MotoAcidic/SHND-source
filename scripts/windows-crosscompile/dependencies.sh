#!/bin/bash -ev

#https://github.com/peercoin/peercoin/wiki/Compiling-for-Windows-on-Debian-linux

#dependencies
sudo apt-get install -yqq  p7zip-full autoconf automake autopoint bash bison bzip2 cmake flex gettext git g++ gperf intltool libffi-dev libtool libltdl-dev libssl-dev libxml-parser-perl make openssl patch perl pkg-config python ruby scons sed unzip wget xz-utils g++-multilib libc6-dev-i386

#mxe
sudo apt-get -qq update
sudo apt --fix-broken install python-pycurl python-apt
#sudo add-apt-repository -y "deb http://pkg.mxe.cc/repos/apt/debian wheezy main"
#echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mxeapt.list
#sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB && sudo apt-get -qq update
#sudo apt-get install -yqq mxe-i686-w64-mingw32.static-boost mxe-i686-w64-mingw32.static-qttools
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86B72ED9
sudo add-apt-repository 'deb [arch=amd64] http://mirror.mxe.cc/repos/apt trusty main'
sudo apt-get update
apt-cache search mxe-

#xenial
#Missing requirement: libtool
#sudo apt install -yqq libtool-bin

#Missing requirement: gdk-pixbuf-csource
sudo apt-get install -yqq libgtk2.0-dev

#install mxe
pushd /opt
test -e "/opt/mxe" || sudo chown -R `whoami` /opt
test -e "/opt/mxe" || git clone https://github.com/mxe/mxe.git
popd

#miniupnpc
wget -O miniupnpc-1.9.tar.gz http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.9.tar.gz
tar xvf miniupnpc-1.9.tar.gz
sudo mv miniupnpc-1.9 /opt/mxe
sudo rm -rf miniupnpc-1.9
popd


#libdb
wget http://download.oracle.com/berkeley-db/db-4.8.30.tar.gz
tar -xf db-4.8.30.tar.gz
sudo mv db-4.8.30 /opt/mxe/db-4.8.30
sudo rm -rf db-4.8.30.tar.gz
popd

#compile boost
pushd /opt/mxe
make -j$(nproc) MXE_TARGETS="i686-w64-mingw32.static" boost

#compile qt5
make -j$(nproc) MXE_TARGETS="i686-w64-mingw32.static" qttools
popd