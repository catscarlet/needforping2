#!/bin/sh
needforping_DIR=/var/www/needforping

TMP_DIR=/$needforping_DIR/shell/pingresult
SERVER_LIST=/$needforping_DIR/shell/server_list.txt
line=$1
OUTPUTTXT=$TMP_DIR/ping_$line.txt
OUTPUTTMP=$TMP_DIR/ping_$line.tmp
OUTPUTFORJS=$TMP_DIR/$line.json

  echo "" > $OUTPUTTXT
  date >> $OUTPUTTXT
  ping -c 100 $line |tail -n 3 >> $OUTPUTTXT

echo readline start && date
  $needforping_DIR/shell/readline3.sh $OUTPUTTXT $OUTPUTTMP
echo readline finish && date
