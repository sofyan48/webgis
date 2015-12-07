<?php
include "plugin/security.php";
$pengguna = $_SESSION['username'];
$idPengguna = $_SESSION['idPengguna'];
?>
<!DOCTYPE html>
<html>
  <head>
    <title><?php echo $pengguna; ?></title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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
    
    <script type="text/javascript">
		var idPengguna = <?php echo $idPengguna; ?>;
    </script>
  </head>
<body>
  <nav class="navbar-top navbar navbar-default" role="navigation">
	<div class="navbar-header">
		 
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button> <a class="navbar-brand" href="#">Not GO JEK</a>
	</div>
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li>
				<a href="#" id=""> <span class="glyphicon glyphicon-envelope"></span> Notification</a>
			</li>
			<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> Profile<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li>
						<a href="#"><span class="glyphicon glyphicon-eye-open"></span> View Profil</a>
					</li>
				</ul>
			</li>
			<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> Settings<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li>
						<a href="#" id="suNav"><span class="glyphicon glyphicon-wrench"></span> Umum</a>
					</li>
					<li>
						<a href="#" id="smNav"><span class="glyphicon glyphicon-map-marker"></span> Maps</a>
					</li>
				</ul>
			</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-ok-sign"></span> Account<strong class="caret"></strong></a>
				<ul class="dropdown-menu">
					<li>
						<a href="#" id=""><span class="glyphicon glyphicon-user"></span> <?php echo $pengguna; ?></a>
					</li>
					<li class="divider">
					</li>
					<li>
						<a href="logout.php" id="logout"><span class="glyphicon glyphicon-off"></span> Log Out</a>
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
						<span class="glyphicon glyphicon-search"></span> Cari Mobil
					</button>
					<button type="button" class="btn btn-block btn-warning btn-default" id="lprAdmin">
						<span class="glyphicon glyphicon-pencil"></span> Lapor Admin
					</button>
					<button type="button" class="btn btn-block btn-danger btn-default">
						<span class="glyphicon glyphicon-remove-sign"></span> Batalkan Pencarian
					</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modalPenunjuk" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">
					Penunjuk Jalan
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-8">
							<div id="panelJalan"></div>
						</div>
						<div class="col-md-4">
							<button type="button" id="btnPesanMobil" class="btn btn-success btn-lg btn-block" data-dismiss="modal">
								Pesan Mobil Sekarang
							</button>
							<button type="button" class="btn btn-danger btn-lg btn-block" data-dismiss="modal">
								Batalkan Pencarian
							</button>  
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">  
			</div>
		</div>	
	</div>
</div>

<div class="modal fade" id="settingMaps" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">
					Pengaturan Umum
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal" role="form">
							<div class="form-group"> 
								<label for="" class="col-sm-4 control-label">
									Contoh Aturan
								</label>
								<div class="col-sm-8">
									<input class="form-control" id="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label>
											<input type="checkbox" /> Tampilkan Penunjuk Jalan
										</label>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer"> 
				<button type="button" class="btn btn-danger" data-dismiss="modal">
					<span class="glyphicon glyphicon-remove-circle"></span> Cancel
				</button> 
				<button type="button" class="btn btn-success" data-dismiss="modal">
					<span class="glyphicon glyphicon-saved"></span> Simpan Pengaturan
				</button> 
			</div>
		</div>	
	</div>
</div>

<div class="modal fade" id="settingUmum" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">
					Pengaturan Maps
				</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal" role="form">
							<div class="form-group"> 
								<label for="" class="col-sm-4 control-label">
									Contoh Aturan
								</label>
								<div class="col-sm-8">
									<input class="form-control" id="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label>
											<input type="checkbox" /> Tampilkan ?
										</label>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer"> 
				<button type="button" class="btn btn-default" data-dismiss="modal">
					Cancel
				</button> 
			</div>
		</div>	
	</div>
</div>

<div class="modal fade" id="pesananDialog" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">
					Pemberitahuan
				</h4>
			</div>
			<div class="modal-body">
				<p>
					Pesanan anda telah kami eksekusi<br />
					Silahkan Menunggu SMS Konfirmasi Dari Supir Pesanan anda.
				</p>
			</div>
			<div class="modal-footer"> 
				<button type="button" class="btn btn-default" data-dismiss="modal">
					Cancel
				</button> 
			</div>
		</div>	
	</div>
</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
	<script src="https://maps.googleapis.com/maps/api/js?signed_in=true"></script>	
	<script src="js/scripts.js"></script>
</body>
</html>
