#!/bin/sh

# APR - Apache Portable Runtime
./tmp/apr-1.6.3/configure --prefix="/httpd_source_tree_root/srclib/apr" 
make
make install

# utils
./tmp/apr-util-1.6.3/configure --prefix="/httpd_source_tree_root/srclib/apr-util" 
make
make install

# installing apache2
./tmp/httpd-2.4.62/configure --prefix="/usr/local/apache2"
make
make install

# Than change configuration
#vi PREFIX/conf/httpd.conf
