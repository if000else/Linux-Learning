#! /bin/bash
#vision 5.5.58
. /etc/init.d/functions
cd /home/oldboy/tools/ &&
useradd mysql -s /sbin/nologin -M &&
tar xf mysql-5.5.58-linux-glibc2.12-x86_64.tar.gz &&
mv mysql-5.5.58-linux-glibc2.12-x86_64 /application/mysql-5.5.58 &&
ln -s /application/mysql-5.5.58 /application/mysql &&
/application/mysql/scripts/mysql_install_db --basedir=/application/mysql/ --datadir=/application/mysql/data/ --user=mysql &&
chown -R mysql.mysql /application/mysql &&
cp /application/mysql/support-files/my-small.cnf /etc/my.cnf &&
sed -i 's#/usr/local/mysql#/application/mysql#g' /application/mysql/bin/mysqld_safe &&
action "insall" /bin/true
echo "/application/mysql/bin:$PATH" >/etc/profile&&
source /etc/profile &&
action "env PATH" /bin/true
cp /application/mysql/support-files/mysql.server /etc/init.d/mysqld
sed -i 's#/usr/local/mysql#/application/mysql#g' /etc/init.d/mysqld
chmod +x /etc/init.d/mysqld
killall mysqld
chkconfig mysqld on
/etc/init.d/mysql start
if [ $? -eq 0 ]
then action "add to startup!" /bin/true
else
action "add to startup" /bin/false
fi