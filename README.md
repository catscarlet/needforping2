# needforping
这是我上传到Github的第一个项目，也是我第一个自己亲自手写的Web项目（虽然图表用了highcharts）。
这个项目的工作方式，就是在机器上定时ping远端主机，收集丢包率和延迟，并用图表的形式展现出来。

目前项目是靠html+js+shell(linux)来运行的，还在优化中，暂时只能展示一段时间的丢包率和平均延迟。





需要手动在crontab中添加类似：
*/2 *   * * *   root    /home/pi/nginx_sites/www/needforping/shell/needforping3.sh
*/2 *   * * *   root    /home/pi/nginx_sites/www/needforping/shell/output100json.sh
每2分钟向目的机ping 100个包，并收集延迟和丢包率。


展示地址：http://pi.catscarlet.com:8091/needforping/
这个地址是一个插在北京联通宽带上的树莓派，性能不是很好，经常500错误，刷新几下就好了。


