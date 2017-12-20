#! /bin/sh
# This scripts use for distributing file to others
# Try before specify ip network
. /etc/init.d/functions
if [ $# -eq 4 ]
   then
   START=`echo $1 |sed -r 's#^.*\.([0-9]+)$#\1#g'`
   STOP=`echo $2 |sed -r 's#^.*\.([0-9]+)$#\1#g'`
   while ((START <= STOP))
   do
      ping -c2 10.0.0.$START >/dev/null 2>&1
      if [ $? -eq 0 ]
      then
      expect /scripts/test.exp 10.0.0.$START $3 $4 >/dev/null 2>&1
      action "server 10.0.0.$START" /bin/true
      else
          action "connect to server$START faied..." /bin/false
      fi
      let START++
   done
else  echo "use:disctribute 10.0.0.3 10.0.0.254 \
/etc/host /etc/host" 
fi