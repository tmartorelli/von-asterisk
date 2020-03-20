#!/bin/bash

sudo yum -y update
sudo amazon-linux-extras install epel -y
sudo setenforce 0
sudo yum -y groupinstall "Development Tools"
sudo yum -y install git libedit-devel sqlite-devel psmisc gmime-devel ncurses-devel libtermcap-devel sox newt-devel libxm12-devel libtiff-devel audiofile-devel gtk2-devel uuid-devel libtool libuuid-devel subversion kernel-devel kernel-devel-$(uname -r) git subversion kernel-devel crontabs cronie cronie-anacron wget vim
cd /usr/src/
sudo git clone https://github.com/akheron/jansson.git
pushd jansson/
sudo autoreconf -i
sudo ./configure --prefix=/usr/
popd
sudo wget https://github.com/pjsip/pjproject/archive/2.8.tar.gz
sudo tar -xzvf 2.8.tar.gz
sudo rm 2.8.tar.gz
pushd pjproject-2.8/
sudo ./configure CFLAGS="-DNDEBUG -DPJ_HAS_IPV6=1" --prefix=/usr --libdir=/usr/lib64 --enable-shared --disable-video --disable-sound --disable-opencore-amr
sudo make dep
sudo make
sudo make install
sudo ldconfig
popd
sudo wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz
sudo tar xvfz asterisk-16-current.tar.gz
sudo rm asterisk-16-current.tar.gz
pushd asterisk-16.9.0/
sudo contrib/scripts/get_mp3_source.sh
sudo contrib/scripts/install_prereq install
sudo yum install libxml2-devel -y
sudo ./configure --libdir=/usr/lib64 --with-jansson-bundled
sudo make
sudo make install
sudo make samples
sudo ldconfig