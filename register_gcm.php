<?php
include "db/conf.php";
//include "plugin/security.php";
$regId = isset($_POST['regId']) ? $_POST['regId'] : "";
$idMobil = isset($_POST['idMobil']) ? $_POST['idMobil'] : "";

if( !empty($regId)){
	$cdate = date("Y-m-d H:i:s");
	$sql = "INSERT INTO android_gcm__devices(device_id, added_date, last_update_date, active,idmobil) VALUES('$regId', '$cdate', '$cdate', 1,'$idMobil');";
	mysql_query($sql) or die("NG:".mysql_error());
	echo "OK";
} else {
	echo "NG";
}
