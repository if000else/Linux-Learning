#! /bin/sh
# install nfs and setup
. /etc/init.d/functions
yum install nfs-utils rpcbind -y >/dev/null 2>&1
if [ $? -eq 0 ]
  then action "yum install result" /bin/true
else
  action "yum inistall result" /bin/false
fi
/etc/init.d/rpcbind start >/dev/null 2>&1
if [ $? -eq 0 ]
  then action "start rpcbind result" /bin/true
else
  action "start rpcbind result" /bin/false
fi
/etc/init.d/nfs start >/dev/null 2>&1
if [ $? -eq 0 ]
  then action "start nfs result" /bin/true
else
  action "start nfs result" /bin/false
fi
echo "use showmount and mount -t nfs to continue
you can add it to startup -o hard,intr"