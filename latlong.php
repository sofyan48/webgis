<?php 
include "db/conf.php";

if (isset($_GET['action']) && $_GET['action'] == 'latlong') {
	$query = "SELECT * FROM tb_posisi";		
	$sql = mysql_query($query) or die($query);
	$data = $_POST;
	$datax = array();
	$datax_r = array();
	while ($row = mysql_fetch_row($sql)) {
		$datax['id'] = $row[0];
		$datax['lat'] = $row[1];
		$datax['long'] = $row[2];
		$datax['speed'] = $row[3];
		$datax['waktu'] = $row[4];
		$datax['status'] = $row[5];
		array_push($datax_r, $datax);
	}
	$data = $datax_r;
	echo json_encode($data);
exit;
}
?>
