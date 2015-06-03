#server1.catscarlet.com
#date >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt
#ping -c 10 www.baidu.com |tail -n 3 >> /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt &

#sleep 12

#./readline2.sh /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt

needforping_DIR=/home/pi/nginx_sites/www/needforping
TMP_DIR=/$needforping_DIR/pingresult
SERVER_LIST=server_list.txt

#echo $TMP_DIR
while read line
do

./goping.sh $line &
#  OUTPUTTXT=$TMP_DIR/ping_$line.txt
#  date >> $OUTPUTTXT
#  ping -c 1 $line |tail -n 3 >> $OUTPUTTXT
#  sleep 2
#  ./readline2.sh $OUTPUTTXT


done < $needforping_DIR/$SERVER_LIST




#tail -n 400 /home/pi/nginx_sites/www/needforping/pingresult/ping_server1.txt > tmp_server1.txt
