#!/bin/sh
#server1.catscarlet.com
#date >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt
#ping -c 10 www.baidu.com |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt &

#sleep 12

#./readline2.sh /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt

needforping_DIR=/home/pi/nginx_sites/www/needforping
TMP_DIR=/$needforping_DIR/pingresult
SERVER_LIST=server_list.txt


line=$1

  OUTPUTTXT=$TMP_DIR/ping_$line.txt
  OUTPUTTMP=$TMP_DIR/ping_$line.tmp
  OUTPUTFORJS=$TMP_DIR/$line.json
  echo "" > $OUTPUTTXT
  date >> $OUTPUTTXT
  #ping -c 1 $line |tail -n 3 >> $OUTPUTTXT
  ping -c 100 $line |tail -n 3 >> $OUTPUTTXT
  #sleep 3
echo readline start && date
  $needforping_DIR/readline3.sh $OUTPUTTXT $OUTPUTTMP
echo readline finish && date



#tail -n 400 /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt > tmp_server1.txt
