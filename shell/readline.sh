#!/bin/sh
i=0
OUTPUT=$2


while read line
do
	i=`expr $i + 1`
	keytext=`echo $line|awk '{print $5}'`

	if [ `echo $keytext|grep CST` ] ;then
		MON=`echo "$line" |awk '{print $2}'`
		DAY=`echo "$line" |awk '{print $3}'`
		TIME=`echo "$line" |awk '{print $4}'`
		continue
	fi

	if [ `echo $keytext|grep received` ] ;then
		LOSS=`echo "$line" |awk '{print $6}'`
		continue
	fi

	if [ `echo $keytext|grep ms` ] ;then
		RTT=`echo "$line" |awk '{print $4}'`
		min=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $1}'`
		avg=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $2}'`
		max=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $3}'`
		mdev=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $4}'`

echo { "\"TIME"\":"\"${MON}_${DAY}_${TIME}"\" , "\"LOSS"\":"\"$LOSS"\" , "\"min"\":"\"$min"\" , "\"avg"\":"\"$avg"\" , "\"max"\":"\"$max"\" } >> $OUTPUT
	fi

done < $1
