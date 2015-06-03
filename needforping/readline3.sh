#!/bin/sh
i=0
OUTPUT=$2
#echo The output is [ $OUTPUT ]
#if [ $OUTPUT ] ;then

#elseif
#OUTPUT="ping_server1.json"
#fi

#	if [ `echo START1` ] ;then
#		echo START2!
#	fi

while read line
do
		i=`expr $i + 1`
#	echo --------------- $i ---------------
#	echo $line
	keytext=`echo $line|awk '{print $5}'`
#	echo $keytext

	if [ `echo $keytext|grep CST` ] ;then
#		echo "TIME GET \c"
		MON=`echo "$line" |awk '{print $2}'`
		DAY=`echo "$line" |awk '{print $3}'`
		TIME=`echo "$line" |awk '{print $4}'`

#		echo ---$MON $DAY $TIME---
		continue
	fi



	if [ `echo $keytext|grep received` ] ;then
#		echo "Result GET \c"
		LOSS=`echo "$line" |awk '{print $6}'`
		continue
	fi


	if [ `echo $keytext|grep ms` ] ;then
#		echo "RTT GET \c"
		RTT=`echo "$line" |awk '{print $4}'`
		#echo ---$RTT---
		min=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $1}'`
		avg=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $2}'`
		max=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $3}'`
		mdev=`echo "$RTT" |awk  'BEGIN{FS="/"} {print $4}'`


echo { "\"TIME"\":"\"${MON}_${DAY}_${TIME}"\" , "\"LOSS"\":"\"$LOSS"\" , "\"min"\":"\"$min"\" , "\"avg"\":"\"$avg"\" , "\"max"\":"\"$max"\" } >> $OUTPUT
	fi

done < $1
