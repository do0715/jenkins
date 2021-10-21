#!/bin/bash
sudo mkdir /web
cd /web
sudo yum install -y wget
sudo wget https://downloads.apache.org/apr/apr-1.7.0.tar.gz
sudo wget https://downloads.apache.org/apr/apr-util-1.6.1.tar.gz
sudo wget https://downloads.apache.org/httpd/httpd-2.4.51.tar.gz
sudo wget https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz --no-check-certificate
sudo tar xvfz apr-1.7.0.tar.gz
sudo tar xvfz apr-util-1.6.1.tar.gz
sudo tar xvfz httpd-2.4.51.tar.gz
sudo tar xvfz pcre-8.45.tar.gz
sudo yum install -y expat-devel gcc gcc-c++
cd apr-1.7.0
sudo ./configure --prefix=/web/apr
sudo make
sudo make install
cd ../apr-util-1.6.1
sudo ./configure --prefix=/web/aprutil --with-apr=/web/apr
sudo make
sudo make install
cd ../pcre-8.45
sudo ./configure --prefix=/web/pcre
sudo make
sudo make install
cd ../httpd-2.4.51
sudo ./configure --prefix /usr/local/apache2 --with-apr=/web/apr --with-apr-util=/web/aprutil --with-pcre=/web/pcre
sudo make
sudo make install
sudo /usr/local/apache2/bin/apachectl start
