<?php
	session_start();
	if(!isset($_SESSION['username'])) {
		header('location:login_page.php'); 
	}else{ 
		$username = $_SESSION['username']; 
	}
?>
