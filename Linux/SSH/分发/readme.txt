1.shell脚本使用
  /bin/sh distribute.sh 10.0.0.1 10.0.0.254 /etc/hosts /data
脚本里面会触发expect使用，从而实现循环访问服务器并且分发文件