<?php
include "plugin/security.php";
session_start(); // memulai session

unset($_SESSION['username']);
session_destroy(); // menghapus session

if ($_SESSION['username']==''){
	echo '<script type="text/javascript">window.location.replace("login_page.php")</script>';
}

?>
