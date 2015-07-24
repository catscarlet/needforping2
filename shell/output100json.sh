#!/bin/sh
needforping_DIR=/var/www/needforping

TMP_DIR=$needforping_DIR/shell/pingresult
SERVER_LIST=$needforping_DIR/shell/server_list.txt

while read line
    do
        OUTPUTTXT=$TMP_DIR/ping_$line.txt
        OUTPUTTMP=$TMP_DIR/ping_$line.tmp
        OUTPUTTMP360=$TMP_DIR/ping_360_$line.tmp
        OUTPUTFORJS=$TMP_DIR/$line.json
        OUTPUTNUM=720

        tail -n $OUTPUTNUM $OUTPUTTMP > $OUTPUTTMP360
        echo "[" > $OUTPUTFORJS
        NUMk=0
        while read line
            do
                if [ $NUMk -eq 1 ] ;then
                    echo "," >> $OUTPUTFORJS
                fi
                NUMk=1
                echo $line >> $OUTPUTFORJS
            done < $OUTPUTTMP360
        echo "]" >> $OUTPUTFORJS
    done < $SERVER_LIST
