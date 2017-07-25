#!/bin/bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $THIS_DIR/common.sh

version=0.10.0
dir=thrift-$version
tarball=$dir.tar.gz

check_lib libthrift libthrift-$version


set -e
if [[ ! -f $tarball ]]; then
  wget http://archive.apache.org/dist/thrift/$version/$tarball
fi
if [[ ! -d $dir ]]; then
  tar -xzvf $tarball
fi
cd $dir
./configure --with-cpp=yes --with-c_glib=no --with-java=no --with-ruby=no --with-erlang=no --with-go=no --with-nodejs=no --with-qt4=no --with-qt5=no
make -j`nproc` && sudo make install
cd lib/py
sudo python setup.py install
cd ../../..
