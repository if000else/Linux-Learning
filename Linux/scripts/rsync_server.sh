#! /bin/sh
. /etc/init.d/functions
#Rsync server
echo "
#create by raoky 2017.12.14
###rsyncd.conf start##
uid = rsync_backup
gid = rsync_backup
use chroot = no
max connections = 2000
timeout = 600
pid file = /var/run/rsyncd.pid
lock file = /var/run/rsync.lock
log file = /var/log/rsyncd.log
ignore errors
read only = false
list = false
hosts allow = 10.0.0.0/24
auth users = rsync_backup
secrets file = /etc/rsync.password
############################
[backup]
comment = backup server by oldboy 21:35 2017-11-01
path = /backup">/etc/rsyncd.conf
#password file
echo "rsync_backup:123456">/etc/rsync.password &&
chmod 600 /etc/rsync.password &&
#add user
useradd rsync_backup -M -s /sbin/nologin