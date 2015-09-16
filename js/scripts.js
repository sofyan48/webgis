$(document).ready(function(){
	setInterval(function(){ 
		window.location.reload();
	}, 500000);
	//ambil nama pengguna
	$.ajax(
	{
	  url : "login.php?action=getUser",
	  type: "POST",
	  success:function(data, textStatus, jqXHR) 
		{
			document.getElementById("userPengguna").value = data;
		},
	  error: function(jqXHR, textStatus, errorThrown) 
		{
		  alert(errorThrown);
		}
	});		
});
var  data = ambilAjax("latlong.php?action=latlong",'get',false);
google.maps.event.addDomListener(window, 'load', initMap);

var mobilDB = JSON.parse(data);

function opmin(a,b,c,d,e){
    var min;
    if(a >= b && b <= c && b <= d && b <= e ){
         min = b;
    }
    else if(c <= b && c <= a && c <= d && c <= e ) {
        min= c;
    }
    else if(d <= b && d <= a && d <= c && d <= e){
		min=d;
	}
	else if (e <= b && e <= a && e <= c && e <= d){
		min=e;
	}
    else {
        min = a;
    }
    return min;
}

function cariJalur(){
	var dataJalan = ambilAjax("getJarak.php?action=dataDijkstra&idAmbil="+document.getElementById("idPengguna").value,'get',false);
		var dataPosisiPengguna = ambilAjax("getJarak.php?action=posisiSaya&idTerakhir="+document.getElementById("idPengguna").value,'get',false);
		
		var obj = jQuery.parseJSON(dataJalan);
		var objPengguna = jQuery.parseJSON(dataPosisiPengguna);
		console.log(obj);
		for (var q=0; q<=obj.length;q++){
			if (q<=5){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
			}
			else if(q<=11){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
				
			}
			else if(q<18){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
			}
			else if(q<24){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
			}
			else if(q<30){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
			}
			else if(q<36){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
			}
			else if(q<42){
				makeRoads(obj[q].start,obj[q].finish,parseInt(obj[q].jarak));
			}
			
		}
		var sa = Dijkstra(roads, objPengguna[0].posisi, obj[2].finish);
		return sa;
		/*
		var a= obj[35].jarak,
			b= obj[36].jarak,
			c= obj[37].jarak,
			d= obj[38].jarak,
			e= obj[39].jarak,
			f= obj[40].jarak,
			g= obj[41].jarak;
		makeRoads(
					obj[35].start, 
					obj[35].finish,a,
					obj[36].finish,b,
					obj[37].finish,c,
					obj[38].finish,d,
					obj[39].finish,e,
					obj[40].finish,f,
					obj[41].finish,g
				);
		var sa = Dijkstra(roads, objPengguna[0].posisi, obj[16].finish);
		//var sb = Dijkstra(roads, objPengguna[0].posisi, obj[17].finish);
		//var sc = Dijkstra(roads, objPengguna[0].posisi, obj[18].finish);
		//var sd = Dijkstra(roads, objPengguna[0].posisi, obj[18].finish);
		return sa;
		*/
}

function ambilAjax(url,type,async)
{
     var result = null;
     $.ajax({
        url: url,
        type: type,
        async: async,
        success: function(data) {
            result = data;
        } 
     });
     return result;
}

function kirimData(url,d){
	$.ajax({
		url: url,
		type: 'POST',
		data:d,
		success: function(status) {
			//console.log(status);
		} 
	});
}

function initMap() {
  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer;
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -0.8193728, lng: 119.8722506},
    zoom: 10
  });
  var infoWindow = new google.maps.InfoWindow({map: map});
  var icon='img/car.png';  
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      infoWindow.setPosition(pos);
      infoWindow.setContent('Anda');
      map.setCenter(pos);
      map.setZoom(14);
      directionsDisplay.setMap(map);
      directionsDisplay.setPanel(document.getElementById('panelJalan'));
      
      var objTempat=titikJalan(mobilDB);
      objTempat.push(pos);
      var objTujuan=titikJalan(mobilDB);
      objTujuan.push(pos);
      var geocoderSaya = new google.maps.Geocoder;
      var geocoderMobil = new google.maps.Geocoder;
      tambahMarker(mobilDB,map);
	  buatJalan(objTempat,objTujuan);
	  posisiSaya(pos);
	  tampilPosisiMobil(geocoderMobil,mobilDB);
	  	 
	  var onClick = function() {
		 var a = cariJalur();
		 console.log(a);
		 if (a==false){
			 alert("Tidak Ada Jalan");
		 }
		 else{
			tampilJalan(directionsService,directionsDisplay,a[1],a[2]);
		 }
	  };
	  document.getElementById('cariMobil').addEventListener('click', onClick);
	  
    },function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    handleLocationError(false, infoWindow, map.getCenter());
  }  
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: Geo Lokasi Tidak Ditemukan.' :
                        'Error: Browser Anda Tidak Mendukung.');
}

function tambahMarker(location, map) {
  var marker;
  var icon='img/car.png';
  var markers = new Array();
  for (var i = 0; i < location.length; i++) { 
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(mobilDB[i].lat, mobilDB[i].long),
			map: map,
			icon: icon
		  });
		  markers.push(marker);
		  google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
			  infowindow.setContent(locations[i][0]);
			  infowindow.open(map, marker);
			}
		  })(marker, i));
	}
}
var titikJalan=function(location){
	var xy=[];
	for (var i = 0; i < location.length; i++) {  
		xy.push({lat:parseFloat(location[i].lat),lng:parseFloat(location[i].long)});
	}
	return xy;
};


function buatJalan(tempat,mobil){
	var service = new google.maps.DistanceMatrixService;
	service.getDistanceMatrix({
		origins: tempat,
		destinations: mobil,
		travelMode: google.maps.TravelMode.DRIVING,
		unitSystem: google.maps.UnitSystem.METRIC,
		avoidHighways: false,
		avoidTolls: false
	},
	function(response, status){
		var originList = response.originAddresses;
		var destinationList = response.destinationAddresses;
		var jarak = [];
		var user = document.getElementById("userPengguna").value;
		//alert(user);
		if (status !== google.maps.DistanceMatrixStatus.OK) {
			alert('Error was: ' + status);
		} 
		else {
			for (var i = 0; i < originList.length; i++) {
				var results = response.rows[i].elements;
				for (var j = 0; j < results.length; j++) {
					jarak.push({
						id:document.getElementById("idPengguna").value+i+j,
						pengguna:document.getElementById("idPengguna").value,
						asal:originList[i],
						tujuan: destinationList[j],
						jarak:results[j].distance.value
					});	
				}
			}
			for (var d = 0; d < jarak.length; d++) {
				if (jarak[d].tujuan == jarak[d].asal){
					jarak.splice(d,1);
				}
				kirimData("getJarak.php?action=getJarak",jarak[d]);
			}
			$.each(jarak,function(data){
				var x = document.getElementById("jalurLokasi");
				var option = document.createElement("option");
				option.text = "Asal :"+this.asal+',Tujuan :'+this.tujuan+",jarak :"+this.jarak;
				x.add(option);
			});
			
			$.each(destinationList,function(data){
				var x = document.getElementById("infoLokasi");
				var option = document.createElement("option");
				option.text = this;
				x.add(option);
			});
		}
	});
}

function posisiSaya(pos) {
  var service = new google.maps.DistanceMatrixService;
	var latlng=[pos];
	service.getDistanceMatrix({
		origins: latlng,
		destinations: latlng,
		travelMode: google.maps.TravelMode.DRIVING,
		unitSystem: google.maps.UnitSystem.METRIC,
		avoidHighways: false,
		avoidTolls: false
	},
	
	function(response, status){
		var originList = response.originAddresses;
		var alamat =[];
		var alamatPenumpang=[];
		if (status !== google.maps.DistanceMatrixStatus.OK) {
			alert('Error was: ' + status);
		} 
		else {
			for (var i = 0; i < originList.length; i++) {
				var results = response.rows[i].elements;	
				alamat.push({
					penumpang: document.getElementById("idPengguna").value,
					latitude:latlng[i].lat,
					longitude:latlng[i].lng,
					posisiTerakhir:originList[i]
				});	
				kirimData("getJarak.php?action=getPosisiPenumpang",alamat[i]);
			}
		}
	});
}


function tampilPosisiMobil(geocoder,pos)
{
	var service = new google.maps.DistanceMatrixService;
	var latlng=[];
	for (var a=0; a<pos.length;a++){
		latlng.push({lat: parseFloat(pos[a].lat), lng: parseFloat(pos[a].long)});
	}
	service.getDistanceMatrix({
			origins: latlng,
			destinations: latlng,
			travelMode: google.maps.TravelMode.DRIVING,
			unitSystem: google.maps.UnitSystem.METRIC,
			avoidHighways: false,
			avoidTolls: false
		},
		
		function(response, status){
			var originList = response.originAddresses;
			var alamat =[];
			var kirimAlamatTerakhir=[];
			if (status !== google.maps.DistanceMatrixStatus.OK) {
				alert('Error was: ' + status);
			} 
			else {
				for (var i = 0; i < originList.length; i++) {
					var results = response.rows[i].elements;	
					alamat.push({
						posisiTerakhir:originList[i]
					});	
				}
			}
			for (var a=0; a<pos.length;a++){
				kirimAlamatTerakhir.push({
					mobil:pos[a].id,
					jalan:alamat[a].posisiTerakhir
				});
				kirimData("getJarak.php?action=getPosisiTerakhir",kirimAlamatTerakhir[a]);
			}
			
		});
}

function tampilJalan(directionsService,directionsDisplay,posisi,tujuan) {
  directionsService.route({
    origin: posisi,
    destination: tujuan,
    travelMode: google.maps.TravelMode.DRIVING
  }, function(response, status) {
	var legs = directionsService.durationInTraffic;
    if (status === google.maps.DirectionsStatus.OK) {
		directionsDisplay.setDirections(response);
		 $("#modalPenunjuk").modal('show');
    } else {
      window.alert('Directions request failed due to ' + status);
    }
  });
}
//algoritma dijkstra
function Dijkstra(roads, source, dest) {
  var inf = Number.POSITIVE_INFINITY;
  var distance = {};
  var done = {};
  var pred = {};
  for (var i in roads) {
    // jalan tidak diketahui
    distance[i] = inf;
    pred[i] = 0;
    done[i] = false;
  }
  
  // jalan dari tempat to ketujuan = 0
  distance[source] = 0;
     
  for (i in roads) {
    var minDist = inf, closest;
    for (var j in roads) {
      if (!done[j]) {
        if (distance[j] <= minDist) {
          minDist = distance[j];
          closest = j;
        }
      }
    }
    done[closest] = true;
    if (closest === dest) {
      break;
    }
        
    var neighbors = roadsFrom(closest);
    for (var nb in neighbors) {
      var w = neighbors[nb];
      if (!done[nb]) { 
        if (distance[closest] + w < distance[nb]) {
          distance[nb] = distance[closest] + w;
          pred[nb] = closest;
        }
      }
    } 
  }
   
  // Selesai, cetak jalur.
  i = dest;
  if (distance[i] < inf) {
    var thePath = i;
    var place = i;
    while (place !== source) {
      place = pred[place];
      if (place !== source) {
        thePath = place + '->' + thePath;
      }
    }
    thePath = place + '->' + thePath;
    return [distance[i],source,dest];
  } else {
    return false;
  }
}

var roads = {};
function makeRoad(from, to, length) {
  function addRoad(from, to) {
    if (!(from in roads)) {
      roads[from] = {};
    }
    roads[from][to] = length;
  }
  addRoad(from, to);
  addRoad(to, from);
}

function makeRoads(start) {
  for (var i = 1; i < arguments.length; i += 2) {
    makeRoad(start, arguments[i], arguments[i + 1]);
  }
}

function roadsFrom(place) {
  var found = roads[place];
  if (found === undefined) {
    console.log("No place named '" + place + "' found.");
  } else {
    return found;
  }
}
