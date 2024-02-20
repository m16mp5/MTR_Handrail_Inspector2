
// Create map
var map = L.map('map').setView([22.2402619, 114.0342207417], 14);
L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {minZoom: 12, maxZoom: 19, attribution:'&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(map);

L.control.scale({maxWidth:100,metric:true,imperial:true}).addTo(map);

// Add berth point coordinates
var circleSize = 9;
var circleColor = 'green';

var CP3A = L.circleMarker([22.239146565, 114.0310795783]);
var CP3B = L.circleMarker([22.2402619, 114.0342207417]);
var CP3C = L.circleMarker([22.241835275, 114.0379916667]);


const berthList = [CP3A, CP3B, CP3C];

const berthCodeList = ["HLC-1", "HLC-2", "HLC-3"];


// hightlight AAA berth points
for (i=0; i<3; i++){

    berthList[i].bindPopup(berthCodeList[i]).setStyle({color: circleColor,fillColor: circleColor,fillOpacity: 1, radius:circleSize, className:'stop'});
    berthList[i].on('mouseover', function (e) {this.openPopup();});
    berthList[i].on('mouseout', function (e) {this.closePopup();});

    berthList[i].addTo(map);
}


// Get coordinates from map
// function onMapClick(e) {alert(e.latlng);}
// map.on('click', onMapClick);
