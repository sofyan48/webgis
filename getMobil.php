<?php
include "db/conf.php";

if (isset($_GET['action']) && $_GET['action'] == 'dataMobil') {
	$query = "select * from tb_mobil";		
	$sql = mysql_query($query) or die($query);
	$data = $_POST;
	$datax = array();
	$datax_r = array();
	while ($row = mysql_fetch_row($sql)) {
		$datax['plat'] = $row[0];
		$datax['supir'] = $row[1];
		$datax['nohp'] = $row[2];
		array_push($datax_r, $datax);
	}
	$data = $datax_r;
	echo json_encode($data);
exit;
}

?>
