#!/bin/bash

ssllib=libssl-dev
lsb_name=`lsb_release -c`
if [[ $lsb_name == *"stretch"* ]]; then
  ssllib=libssl1.0-dev
fi


set -e
sudo apt-get install -y \
    automake \
    cmake \
    libjudy-dev \
    libgmp-dev \
    libpcap-dev \
    libboost-dev \
    libboost-test-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-thread-dev \
    libevent-dev \
    libpython-dev \
    libpython3-dev \
    libtool \
    flex \
    bison \
    pkg-config \
    g++ \
    $ssllib \
    mktemp \
    libffi-dev \
    python-dev \
    python-pip \
    wget

tmpdir=`mktemp -d -p .`
cd $tmpdir

bash ../travis/install-thrift.sh
bash ../travis/install-nanomsg.sh
sudo ldconfig
bash ../travis/install-nnpy.sh

cd ..
sudo rm -rf $tmpdir
