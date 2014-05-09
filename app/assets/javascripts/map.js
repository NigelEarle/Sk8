
$(function() {

  map = L.map('map').setView([114.1310553, 22.2606655 ], 13);

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
  var lat = position.coords.latitude;
  var longitude = position.coords.longitude;
  map.panTo(new L.LatLng(lat, longitude));
  L.marker([lat, longitude]).addTo(map);
}