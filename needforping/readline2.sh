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

#	if [ `echo $keytext|grep "---"` ] ;then
#		echo TARGET GET
#		TARGET=`echo "$line" |awk '{print $2}'`

#		echo ---$TARGET---
#	fi

	if [ `echo $keytext|grep received` ] ;then
#		echo "Result GET \c"
		LOSS=`echo "$line" |awk '{print $6}'`

#		echo ---$LOSS---
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
#		echo ---$min---$avg---$max---$mdev
#		continue


	echo 第 ` expr $i / 4 ` 次测试
	echo 测试时间：$MON $DAY日$TIME
	echo 丢包率：$LOSS
	echo 最小延迟：$min 平局延迟：$avg 最大延迟 $max
#	echo ${MON}_${DAY}_${TIME}
	echo "JSON: \c"
#	echo {"${MON}_${DAY}_${TIME}": [{ "TIME":"${MON}_${DAY}_${TIME}" , "LOSS":"$LOSS" , "min":"$min" , "avg":"$avg" , "max":"$max" }]}
#	echo {"\"${MON}_${DAY}_${TIME}"\": [{ "TIME":"\"${MON}_${DAY}_${TIME}"\" , "LOSS":"\"$LOSS"\" , "min":"\"$min"\" , "avg":"\"$avg"\" , "max":"\"$max"\" }]} >> $OUTPUT

echo { "\"TIME"\":"\"${MON}_${DAY}_${TIME}"\" , "\"LOSS"\":"\"$LOSS"\" , "\"min"\":"\"$min"\" , "\"avg"\":"\"$avg"\" , "\"max"\":"\"$max"\" } >> $OUTPUT
	fi




done < $1


#getpingtime()
#echo getpingtime
