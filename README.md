# needforping2
## 简介
项目Need For Ping 2 [https://github.com/catscarlet/needforping](https://github.com/catscarlet/needforping) 的升级版，由之前将数据保存到文件更改为保存到mysql数据库

项目工作方式是定时ping远端主机，收集丢包率和延迟，并用图表展示。

项目是靠html+php+mysql+js+bash(unix shell)编写和运行的。

目前项目正在开发中，基础功能已经完成，但仍有很多细节和功能需要添加和完善......

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
  | Field        | Type     | Null | Key | Default | Extra          |
  | id           | int(11)  | NO   | PRI | NULL    | auto_increment |
  | server_name  | text     | NO   |     | NULL    |                |
  | DATETIME     | datetime | NO   |     | NULL    |                |
  | loss_percent | text     | NO   |     | NULL    |                |
  | rtt_min      | int(11)  | NO   |     | NULL    |                |
  | rtt_avg      | int(11)  | NO   |     | NULL    |                |
  | rtt_max      | int(11)  | NO   |     | NULL    |                |
  ```

- 手动在crontab中添加类似：

  ```
  */2 *   * * *   root    /var/www/needforping2/shell/needforping2.sh
  ```

### 升级
本项目仍处于开发调优状态，数据存储和展示会有频繁改动，暂不支持升级安装。更新新版请根据代码改动，自行修改或删除已有sql记录

## 配置
目前由query.php参数控制最大输出数据量

```
$query_range=180;
```

## 代码组成
开发中

## 项目展示
展示地址：[http://pi.catscarlet.com:8091/needforping2/](http://pi.catscarlet.com:8091/needforping2/)

这个地址是一个插在北京联通宽带上的树莓派，偶尔会关机，打不开很正常。

未来会提供长期稳定的demo展示地址。

## 已知缺陷
开发中

## TODO
开发中
