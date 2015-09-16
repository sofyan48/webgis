<?php 
include "db/conf.php";

$id = $_POST['id'];
$idPengguna = $_POST['pengguna'];
$asal = $_POST['asal'];
$tujuan = $_POST['tujuan'];
$jarak = $_POST['jarak'];

$mobil = $_POST['mobil'];
$posisi = $_POST['jalan'];

$idPenumpang = $_POST['penumpang'];
$idPosisiPenumpang =  $_POST['posisiTerakhir'];

//ambil data
$idAmbil = $_GET['idAmbil'];
$idPosisiPengguna = $_GET['idTerakhir'];


if (isset($_GET['action']) && $_GET['action'] == 'getJarak') {
	if ($jarak == 0){
		echo "maaf data null";
	}
	else{
		$cekQuery = "SELECT * FROM tb_jalan where id_jalan='$id'";
		$sqlCek = mysql_query($cekQuery);
		if (mysql_num_rows($sqlCek) > 0) {		
			$query = "UPDATE tb_jalan SET jarak='$jarak',start='$asal',finish='$tujuan' WHERE id_jalan='$id'";
			$pesan = "";
			if($sql=mysql_query($query)){
				$pesan="Berhasil Diupdate";
				echo $pesan;
			}
			else{
				$pesan="Gagal Disimpan";
				echo $pesan .= mysql_error();
			}
		} 
		else {
			$query=sprintf("INSERT INTO tb_jalan VALUES ('%s','%s','%s','%s','%s')",
						mysql_escape_string($id),
						mysql_escape_string($idPengguna),
						mysql_escape_string($asal),
						mysql_escape_string($tujuan),
						mysql_escape_string($jarak)
			);
			$pesan = "";
			if($sql=mysql_query($query)){
				$pesan="Berhasil Disimpan";
				echo $pesan;
			}
			else{
				$pesan="Gagal Disimpan";
				echo $pesan .= mysql_error();
			}
		}		
	}
exit;
}

else if (isset($_GET['action']) && $_GET['action'] == 'getPosisiTerakhir') {
	/*
	$query=sprintf("INSERT INTO tb_posisi_terakhir VALUES (NULL,'%s','%s')",
					mysql_escape_string($mobil),
					mysql_escape_string($posisi)
	);
	*/
	$query = "UPDATE tb_posisi_terakhir SET jalan='$posisi' WHERE id_mobil='$mobil'";
	$pesan = "";
	if($sql=mysql_query($query)){
		$pesan="Berhasil Di Update";
		echo $pesan;
	}
	else{
		$pesan="Gagal Disimpan";
		echo $pesan .= mysql_error();
	}
	
exit;
}

else if (isset($_GET['action']) && $_GET['action'] == 'getPosisiPenumpang') {
	$cekQuery = "SELECT * FROM tb_penumpang where id_pengguna='$idPenumpang'";
	$sqlCek = mysql_query($cekQuery);
	if (mysql_num_rows($sqlCek) > 0) {		
		$queryUpdate = "UPDATE tb_penumpang SET posisi_terakhir='$idPosisiPenumpang' WHERE id_pengguna='$idPenumpang'";
		$pesan = "";
		if($sql=mysql_query($queryUpdate)){
			$pesan="Berhasil Di Update";
			echo $pesan;
		}
		else{
			$pesan="Gagal Disimpan";
			echo $pesan .= mysql_error();
		}
	} 
	else {
		$query=sprintf("INSERT INTO tb_penumpang VALUES (NULL,'%s','%s')",
				mysql_escape_string($idPenumpang),
				mysql_escape_string($idPosisiPenumpang)
		);
		$pesan = "";
		if($sql=mysql_query($query)){
			$pesan="Berhasil Di Tambahkan";
			echo $pesan;
		}
		else{
			$pesan="Gagal Disimpan";
			echo $pesan .= mysql_error();
		}
	}
exit;
}


else if (isset($_GET['action']) && $_GET['action'] == 'dataDijkstra') {
	$query = "select * from tb_jalan where id_pengguna='$idAmbil'";		
	$sql = mysql_query($query) or die($query);
	$data = $_POST;
	$datax = array();
	$datax_r = array();
	while ($row = mysql_fetch_row($sql)) {
		$datax['id'] = $row[0];
		$datax['pengguna'] = $row[1];
		$datax['start'] = $row[2];
		$datax['finish'] = $row[3];
		$datax['jarak'] = $row[4];
		array_push($datax_r, $datax);
	}
	$data = $datax_r;
	echo json_encode($data);
exit;
}

else if (isset($_GET['action']) && $_GET['action'] == 'posisiSaya') {
	$query = "SELECT * FROM tb_penumpang where id_pengguna='$idPosisiPengguna'";		
	$sql = mysql_query($query) or die($query);
	$data = $_POST;
	$datax = array();
	$datax_r = array();
	while ($row = mysql_fetch_row($sql)) {
		$datax['id'] = $row[0];
		$datax['pengguna'] = $row[1];
		$datax['posisi'] = $row[2];
		array_push($datax_r, $datax);
	}
	$data = $datax_r;
	echo json_encode($data);
exit;
}
/*
else if (isset($_GET['action']) && $_GET['action'] == 'posisiMobil') {
	$query = "";		
	$sql = mysql_query($query) or die($query);
	$data = $_POST;
	$datax = array();
	$datax_r = array();
	while ($row = mysql_fetch_row($sql)) {
		$datax[''] = $row[];
		array_push($datax_r, $datax);
	}
	$data = $datax_r;
	echo json_encode($data);
exit;
}
*/
?>
