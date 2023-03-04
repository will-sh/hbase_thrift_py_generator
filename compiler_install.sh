#!/bin/sh
echo -e "Start Apache Thrift compiler installation... "
mkdir thrift_compiler_installation
cd thrift_compiler_installation
echo -e "#1. Update the System"
sudo yum -y update
echo -e "#2. Install the Platform Development Tools"
sudo yum -y groupinstall "Development Tools"
echo -e "#3. Upgrade autoconf/automake/bison"
echo -e "#3.1. Upgrade autoconf"
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar xvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure --prefix=/usr
make
sudo make install
cd ..
echo -e "#3.2 Upgrade automake"
wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
tar xvf automake-1.14.tar.gz
cd automake-1.14
./configure --prefix=/usr
make
sudo make install
cd ..
echo -e "3.3 Upgrade bison"
wget http://ftp.gnu.org/gnu/bison/bison-2.5.1.tar.gz
tar xvf bison-2.5.1.tar.gz
cd bison-2.5.1
./configure --prefix=/usr
make
sudo make install
cd ..
echo -e "#4 Add Optional C++ Language Library Dependencies"
sudo yum -y install libevent-devel zlib-devel openssl-devel
wget http://sourceforge.net/projects/boost/files/boost/1.56.0/boost_1_56_0.tar.gz
tar xvf boost_1_56_0.tar.gz
cd boost_1_56_0
./bootstrap.sh
sudo ./b2 install
cd ..
echo -e "#5 Build and Install the Apache Thrift IDL Compiler"
git clone https://github.com/apache/thrift.git
cd thrift
./bootstrap.sh
./configure --with-lua=no
make
sudo make install
cd ..
echo -e "#6 Check thrift compiler version"
thrift -version
