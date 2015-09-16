<?php
include "plugin/security.php";
$pengguna = $_SESSION['username'];
$idPengguna = $_SESSION['idPengguna'];
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Aristo</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
      html, body {
        height: 100%;
        margin: 0;
      }
      #map {
        height: 60%;
        width:100%;
        position:relative;
      }
    </style>
	<link href="css/style.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
	<script src="https://maps.googleapis.com/maps/api/js?signed_in=true"></script>	
  </head>
<body>
  <nav class="navbar-top navbar navbar-default" role="navigation">
	<div class="navbar-header">
		 
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button> <a class="navbar-brand" href="#">Track</a>
	</div>
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li class="active">
				<a href="#" id="">link</a>
			</li>
			<li>
				<a href="#">Link</a>
			</li>
			<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li>
						<a href="#">Action</a>
					</li>
					<li>
						<a href="#">Another action</a>
					</li>
					<li>
						<a href="#">Something else here</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">Separated link</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">One more separated link</a>
					</li>
				</ul>
			</li>
		</ul>
		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<input type="text" class="form-control" />
			</div> 
			<button type="submit" class="btn btn-default">
				Submit
			</button>
		</form>
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="#">Link</a>
			</li>
			<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li>
						<a href="logout.php" id="logout">Log Out</a>
					</li>
					<li>
						<a href="#">Another action</a>
					</li>
					<li>
						<a href="#">Something else here</a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="#">Separated link</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
<div id="map"></div>
<div id="semua" class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row jarak">
				<div class="col-md-10">
					<div class="tabbable" id="tabs-662392">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#panelInfoLok" data-toggle="tab">Informasi Lokasi</a>
							</li>
							<li>
								<a href="#panelInfoMob" data-toggle="tab">Informasi Mobil</a>
							</li>
							<li>
								<a href="#panelInfoJalur" data-toggle="tab">Informasi Jalur</a>
							</li>
							<li>
								<a href="#panelInfoUser" data-toggle="tab">Informasi Pengguna</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="panelInfoLok">
								<p id="">
									<b>Info Lokasi Mobil, Posisi Anda Yang Paling Dibawah</b>
								</p>
								<select id="infoLokasi" class="form-control" size="5"></select>
							</div>
							<div class="tab-pane" id="panelInfoMob">
								<select id="infoMobil" class="form-control" size="5"></select>
							</div>
							<div class="tab-pane" id="panelInfoJalur">
								<select id="jalurLokasi" class="form-control" size="5"></select>
							</div>
							<div class="tab-pane" id="panelInfoUser"><br />
							<input type="text" class="form-control" id="userPengguna" value="<?php echo $pengguna; ?>" readOnly />
							<input type="text" class="form-control hide" id="idPengguna" value="<?php echo $idPengguna; ?>" readOnly />
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-2 jarakTombol">
					<button id="cariMobil" type="button" class="btn btn-block btn-success btn-default">
						Cari Mobil
					</button>
					<button type="button" class="btn btn-block btn-warning btn-default">
						Lapor Admin
					</button>
					<button type="button" class="btn btn-block btn-danger btn-default">
						Batalkan Pencarian
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalPenunjuk" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"  data-backdrop="static" data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">
					Penunjuk Jalan
				</h4>
			</div>
			<div class="modal-body">
				<div id="panelJalan"></div>
			</div>
			<div class="modal-footer"> 
				<button type="button" class="btn btn-success" data-dismiss="modal">
					Pesan Mobil Sekarang
				</button> 
				<button type="button" class="btn btn-default" data-dismiss="modal">
					Cancel
				</button> 
			</div>
		</div>	
	</div>
</div>

<script src="js/scripts.js"></script>
</body>
</html>
