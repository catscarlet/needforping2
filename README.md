# needforping
这是我上传到Github的第一个项目，也是我第一个自己亲自手写的Web项目。

项目工作方式是定时ping远端主机，收集丢包率和延迟，并用图表展示。

项目是靠html+js+shell(linux)编写和运行的。

还在优化中，目前可以展示最近一段时间丢包率和平均延迟。


需要手动在crontab中添加类似：

    */2 *   * * *   root	/var/www/needforping/shell/needforping3.sh 
    */2 *   * * *   root	/var/www/needforping/shell/output100json.sh

needforping3.sh每2分钟向目的机ping 100个包，并收集延迟和丢包率。

output100json.sh每2分钟将收集到的数据转换为json文件。


展示地址：http://pi.catscarlet.com:8091/needforping/

这个地址是一个插在北京联通宽带上的树莓派，偶尔会关机，所以打不开很正常233。


