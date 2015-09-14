<?php
include "db/conf.php";
$username = strip_tags($_POST['username']);
$password = strip_tags($_POST['password']);
$username = mysql_real_escape_string($username);
$password = mysql_real_escape_string($password);
if (isset($_GET['action']) && $_GET['action'] == 'login') {
	//$passmd5 = md5($password);
	$query = "SELECT * FROM tb_pengguna WHERE username = '".$username."' AND password ='".$password."' LIMIT 0,1";
	$sql = mysql_query($query);
	while ($row = mysql_fetch_row($sql)) {
		if (($row[1] == $username) && ($row[2] == $password)) 
		{
			session_start(); 
			$_SESSION['username'] = $username;
			$_SESSION['idPengguna'] = $row[0];
		}
		else 
		{
			echo "false";
		}
	}
exit;
}

else if (isset($_GET['action']) && $_GET['action'] == 'getUser'){
	session_start(); 
	echo $_SESSION['username'];
exit;
}
?>
