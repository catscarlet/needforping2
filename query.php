<?php
/** The name of the database */
define('DB_NAME', 'needforping2');
/** MySQL database username */
define('DB_USER', 'needforping2');
/** MySQL database password */
define('DB_PASSWORD', 'needforping2');


$q=$_GET["q"];

$con = mysql_connect('localhost', constant('DB_USER'), constant('DB_PASSWORD'));
if (!$con)
 {
 die('Could not connect: ' . mysql_error());
 }

mysql_select_db(constant('DB_NAME'), $con);
//echo $sql."<br>";
$sql="select * from pingresult where server_name = '".$q."'";
//$sql="select * from pingresult where server_name = '"."server2.catscarlet.com"."'";
//$sql="select * from pingresult where id = '"."5615"."'";
//echo $sql."<br>";

$result = mysql_query($sql);
//echo $result;
//$row = mysql_fetch_array($result);
//echo $row;
$clickoutput = [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6];
//$clickoutput = array('First' => "Check out !!!",'Second' => $row );
//$clickoutputjson = json_encode($clickoutput);
//echo $clickoutputjson;

//print_r (json_encode ($clickoutput));
$i=0;
while($row = mysql_fetch_array($result) and $i <= 5)
 {
     //$query_server_name[$i]['server_name']=$q;
     $query_DATA[$i]['DATETIME']=$row['DATETIME'];
     $query_DATA[$i]['loss_percent']=$row['loss_percent'];
     $query_DATA[$i]['rtt_avg']=$row['rtt_avg'];
     $i=$i+1;
//echo $row['server_name']." is ".$row['rtt_avg']."<br>";
//print_r (mysql_fetch_array($result));
 }

$query_data=array('server_name' => $q);
$query_data=array_merge($query_data,$query_DATA);
print_r (json_encode($query_data));
//print_r ($query_data);
$clickoutput = array('First' => "BBADSFWEGW",'Second' =>getdate() );
$clickoutputjson = json_encode($clickoutput);
//echo $clickoutputjson;

mysql_close($con);