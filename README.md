# Need For Ping 2

**该项目已废弃，所有工作已转移到
[Need For Ping](https://github.com/catscarlet/needforpingthinksmarty)，请前往新项目。**

## 简介
项目Need For Ping[https://github.com/catscarlet/needforping](https://github.com/catscarlet/needforping) 的升级版，由之前将数据保存到文件更改为保存到mysql数据库，增加陈旧数据的删除，减少json的请求，修复旧版本的一些问题。

项目工作方式是定时ping远端主机，收集丢包率和延迟，并用图表展示。

项目是靠html+php+mysql+js+bash(unix shell)编写和运行的。

底层依靠shell脚本做数据的采集；界面使用一个简单的html做框架，js做ajax取数据做查询，php负责从mysql读取数据并输出json格式，最终由highcharts JS图表库进行展示

**注意，needforping2版本仅支持同一页面显示一组数据，不能像旧版needforping一样同时显示多组数据**

### 软件截图
![needforping2 logo](https://github.com/catscarlet/needforping2/blob/needforping2/snapshot.png)

## 安装
### 全新安装
- 部分shell脚本需要修改其安装目录：

  ```
  needforping2_DIR=/var/www/needforping2
  ```

- 给$needforping_DIR/shell/目录下的shell脚本增加运行权限
- 在mysql数据库中增加库needforping2，用户名/密码:needforping2/needforping2，数据表pingresult。可在query.php中修改

  ```
  mysql> show COLUMNS from pingresult;  
  | Field        | Type        | Null | Key | Default | Extra          |

  | id           | int(11)     | NO   | PRI | NULL    | auto_increment |
  | server_name  | text        | NO   |     | NULL    |                |
  | DATETIME     | datetime    | NO   |     | NULL    |                |
  | loss_percent | text        | NO   |     | NULL    |                |
  | rtt_min      | int(11)     | NO   |     | NULL    |                |
  | rtt_avg      | int(11)     | NO   |     | NULL    |                |
  | rtt_max      | int(11)     | NO   |     | NULL    |                |
  | state        | varchar(10) | YES  |     | normal  |                |
  ```

- 手动在crontab中添加类似：

  ```
  */2 *   * * *   root    /var/www/needforping2/shell/needforping2.sh
  ```

### 升级
本项目不支持从needforping版本升级，也不支持needforping2各commit版本升级

## 配置
目前由query.php参数$query_range控制最大输出数据量，目前默认是一天；pingresult_clean($q)中的$retain_count负责保存的最大日志数量。默认pingresult_clean($q)的调用已经注掉了。

```
$query_range=720;
$retain_count=1440;
```

## 代码组成
### Bash部分
shell部分每2分钟向目的机ping 100个包，收集延迟和丢包率，并保存到mysql中。 其中：
- needforping2.sh负责读取server_list.txt
- goping2.sh负责收集延迟和丢包率，并保存到临时文件中
- readline2.sh负责将临时文件中的数据转换成为mysql数据

### js部分
js部分负责从php取数据，并用图表展示 其中：
- getquery.js负责ajax的处理，以及从php取数据
- draw_LATENCY.js和draw_LOSS.js包含调用图表的函数（可以合并到一起的）

### php部分
php部分负责从mysql读取数据并输出json格式

## 项目展示
无

## 已知缺陷
- 因为整个流程设计的原因needforping2版本仅支持同一页面显示一组数据，不能像旧版needforping一样同时显示多组数据。简易修改的话，会导致highcharts的横坐标轴取多次。
- 数据清理函数pingresult_clean($q)没有找到合适的时机，原本计划每次查询时调用，但感觉太过于山寨，效果不高，性能很低。考虑之前参与过的项目中使用linux的crontab做清理，但又会引用到linux，增加复杂度。如果添加进已有shell脚本的话，感觉则仍然很山寨
- shell部分仍然会输出临时文件到pingresult目录，虽然不会像上一个版本无线肿大了，但临时文件仍旧会消耗系统IO

## TODO
考虑新建项目needforping3，之所以开这么多项目，主要是为了解决不同问题。needforping主要是为了争取一个思路。needforping2则是为了解决数据保存问题和ajax数据请求问题。

这个版本某种意义上讲，很山寨。为了使用ajax，使用了固定的JS去get PHP的数据，数据以json的固定格式返回，导致返回的数据组数固定。虽然可以修改JS的请求和格式来增加显示的组数，但显示组数固定的问题不能动态解决。考虑固定几组，空数据返回给highcharts，感觉更山寨，没那么做。

下一个版本，计划完成同一图表多组显示的效果，需要使用php进行draw函数的生成，也就是说不能再使用固定的js脚本去调用highcharts了，这将会使整个项目的结构和代码有很大的变化，改动差异太大，不适合在同一个项目中继续进行
