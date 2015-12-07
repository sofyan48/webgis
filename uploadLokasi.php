<?php
include "db/conf.php";
if (isset($_GET['action']) && $_GET['action'] == 'updateLokasi') {
	$sql = "UPDATE tb_posisi SET
			latitude = ".$_GET['latitude'].",
			longitude = ".$_GET['longitude'].",
			speed = ".$_GET['speed'].",
			status = '".$_GET['status']."',
			waktu = NOW()
			WHERE id = ".$_GET['idmobil'];
	$q = mysql_query($sql);
	if($q){
		echo "OK";
	}
	else{
		echo "NG";
	}
exit;
}
?>
