#!/usr/local/bin/php -q
<?php
error_reporting(0);

$phost="localhost";
$puser="root";
$ppass="aristo@123456";
$pdb_name="db_gps";

$pkoneksi=mysql_connect($phost,$puser,$ppass) or die("ndak konek2");
$ppilihdb=mysql_select_db($pdb_name) or die("database tidak ada2");

set_time_limit(0);
ob_implicit_flush();
$address = '103.245.72.45';
$port = 6969;

if (($sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) === false) {
    echo "pembuatan Socket Error: " . socket_strerror(socket_last_error()) . "\n";
}

if (socket_bind($sock, $address, $port) === false) {
    echo "socket_bind() Error " . socket_strerror(socket_last_error($sock)) . "\n";
}

if (socket_listen($sock, 5) === false) {
    echo "socket_listen() Error " . socket_strerror(socket_last_error($sock)) . "\n";
}

while (true) {
	$client = socket_accept($sock);
	$input = socket_read($client, 1024000);
	$output = ereg_replace("[ \t\n\r]","",$input)."\0";
	if($output!=""){
		echo $output;
		mysql_query("insert into datagps values(NULL,'$output')");
		$a=explode("#",$output);
		$tot=count($a);
		
		for($i=1;$i<$tot;$i++){
			if($i<6){
				$a[$i];
			}
			else
			{
				$b=explode(",",$a[$i]);
				$utc=$b[1];
				
				if($utc!="")
				{
					$idgps=$a[1];
					$utc=$b[1];
					$status=$b[2];
					$latitude=$b[3];
					$ns=$b[4];
					$longitude=$b[5];
					$ew=$b[6];
					$speed=($b[7]*1.852);
					$course=$b[8];
					$date=$b[9];
					if($ns=="S") $lats="-";
					else $lats="";
					if($ew=="W") $longs="-";
					else $longs="";
					$lat=$lats.((substr($latitude,0,2)+(substr($latitude,2,7)/60)));
					$long=$longs.((substr($longitude,0,3)+(substr($longitude,3,7)/60)));

					$hari=(substr($b[9],0,2));
					$bulan=(substr($b[9],2,2));
					$tahun="20".(substr($b[9],4,2));
					$tang=$tahun."-".$bulan."-".$hari;

					echo $imei="$a[1]";

					$hho=(substr($b[1],0,2));
					$mmo=(substr($b[1],2,2));
					$sso=(substr($b[1],4,2));
					$timeo=$tang." ".$hho.":".$mmo.":".$sso;
					$timeo=date("Y-m-d H:i:s"); //, strtotime($timeo."+8 hour")

					$state=$a[4];
					
					$query ="insert into tb_log values (NULL,'$imei','$lat', '$long', '$speed', '$timeo', '$state')";
					mysql_query($query);
					$pesan = "";
					if($sql=mysql_query($query)){
						//$pesan="Berhasil Disimpan";
						echo $pesan;
					}
					else{
						$pesan="Gagal Disimpan\n";
						echo $pesan .= mysql_error();
					}
					
					$query2 = "update tb_posisi set latitude='$lat', longitude='$long', speed='$speed', status='$state',waktu='$timeo' where id='$imei'";
					$pesan2 = "";
					if($sql2=mysql_query($query2)){
						$pesan2="Berhasil Disimpan";
						echo $pesan2;
					}
					else{
						$pesan2="Gagal Disimpan\n";
						echo $pesan2 .= mysql_error();
					}
					
				}
			}
		}

	}
socket_close($client);
}
socket_close($sock);
?>

