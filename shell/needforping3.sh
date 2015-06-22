#!/bin/sh
#server1.catscarlet.com
#date >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt
#ping -c 10 www.baidu.com |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt &

#sleep 12

#./readline2.sh /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt

needforping_DIR=/var/www/needforping


TMP_DIR=/$needforping_DIR/shell/pingresult
SERVER_LIST=/$needforping_DIR/shell/server_list.txt

while read line
do
  $needforping_DIR/shell/goping3.sh $line &
done < $SERVER_LIST




#tail -n 400 /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt > tmp_server1.txt
