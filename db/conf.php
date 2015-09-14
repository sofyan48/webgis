<?php 
	$host = "localhost"; 
	$user = "root"; 
	//$pass = "aristo@123456"; 
	$pass = "qazwsx"; 
	$db = "db_gps"; 
	$konek = mysql_connect($host, $user, $pass) or die ('Koneksi Gagal! '); 
	mysql_select_db($db); 
?>
