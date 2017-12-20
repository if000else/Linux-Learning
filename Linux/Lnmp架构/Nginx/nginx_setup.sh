#! /bin/bash
. /etc/init.d/functions
# version 1.6.3
cd /home/oldboy/tools/ &&
tar xf nginx-1.6.3.tar.gz &&
cd nginx-1.6.3 &&
./configure --prefix=/application/nginx-1.6.3 --group=nginx --user=nginx --with-http_ssl_module --with-http_stub_status_module &&
useradd nginx -s /sbin/nologin -M
make && make install
ln -s /application/nginx-1.6.3 /application/nginx &&
/application/nginx/sbin/nginx &&
curl 127.0.0.1
if [ $? -eq 0 ]
then action "result:" /bin/true
else action "result:" /bin/false
fi