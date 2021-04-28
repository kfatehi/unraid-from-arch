#!/bin/bash
cd /opt
wget https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz
tar -zxvf openssl-1.0.2u.tar.gz
cd openssl-1.0.2u
./config --prefix=/opt/openssl-1.0 shared
make
make test
make install
