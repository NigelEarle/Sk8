
$(function() {

  map = L.map('map').setView([114.1310553, 22.2606655 ], 17);

  L.tileLayer('https://{s}.tiles.mapbox.com/v3/nwre.i640d78h/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      maxZoom: 18
  }).addTo(map);


  getLocation();

});

function getLocation() {
  if (navigator.geolocation)
    {
    navigator.geolocation.getCurrentPosition(showPosition);
    }
  else{console.log("Geolocation is not supported by this browser.");}
}

function showPosition(position) {
  window.lat = position.coords.latitude;
  window.longitude = position.coords.longitude;
    $('input#latitude').val(window.lat);
    $('input#longitude').val(window.longitude);
    $('#SpotAddress').attr('placeholder','(GPS Found - No Address needed)');
  map.panTo(new L.LatLng(window.lat, window.longitude));

  if ( "gon" in window ) {
    for(var i = 0; i < gon.spots.length; i++) {
     var spot = gon.spots[i]
     L.marker([spot.latitude, spot.longitude]).addTo(map)
      .bindPopup(spot.name +"<br>"+ spot.description)
    }
  } else {
    L.marker([window.lat, window.longitude]).addTo(map);
  }


}