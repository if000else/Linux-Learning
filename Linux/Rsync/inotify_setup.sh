#! /bin/bash
. /etc/init.d/functions
ls -s /proc/sys/fs/inotify
if [ $? -eq 0 ]
then action "check compatablity" /bin/true
else
     action "check" /bin/false
fi
cd /home/oldboy/tools/
tar xf inotify-tools-3.13.tar.gz &&
cd inotify-tools-3.13 &&
./configure --prefix=/usr/local/inotify-3.13 &&
ln -s /usr/local/inotify-3.13 /usr/local/inotify &&
action "result:" /bin/true