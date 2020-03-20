sudo amazon-linux-extras install epel
setenforce 0
yum -y groupinstall "Development Tools"
yum -y install libedit-devel sqlite-devel psmisc gmime-devel ncurses-devel libtermcap-devel sox newt-devel libxm12-devel libtiff-devel audiofile-devel gtk2-devel uuid-devel libtool libuuid-devel subversion kernel-devel kernel-devel-$(uname -r) git subversion kernel-devel crontabs cronie cronie-anacron wget vim
cd /usr/src/
git clone https://github.com/akheron/jansson.git
pushd jansson/
autoreconf -i
./configure --prefix=/usr/
popd
wget https://github.com/pjsip/pjproject/archive/2.8.tar.gz
tar -xzvf 2.8.tar.gz
rm 2.8.tar.gz
pushd pjproject-2.8/
./configure CFLAGS="-DNDEBUG -DPJ_HAS_IPV6=1" --prefix=/usr --libdir=/usr/lib64 --enable-shared --disable-video --disable-sound --disable-opencore-amr
make dep
make
make install
make install
ldconfig
popd
wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-16-current.tar.gz
tar xvfz asterisk-16-current.tar.gz
rm asterisk-16-current.tar.gz
pushd asterisk-16.9.0/
contrib/scripts/get_mp3_source.sh
contrib/scripts/install_prereq install
yum install libxml2-devel
./configure --libdir=/usr/lib64 --with-jansson-bundled
make
make install
make samples
ldconfig