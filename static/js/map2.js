
// Create map
var map = L.map('map').setView([22.299347, 113.93839], 18);
L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {minZoom: 14, maxZoom: 19, attribution:'&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}).addTo(map);

L.control.scale({maxWidth:100,metric:true,imperial:true}).addTo(map);

// Add berth point coordinates
var circleSize = 9;
var circleColor = 'green';

// var CP3A = L.circleMarker([22.243469, 114.036293]);
// var CP3B = L.circleMarker([22.243469, 114.036293]);


var CP3A = L.circleMarker([22.298848, 113.938181]);
var CP3B = L.circleMarker([22.299734, 113.938575]);



const berthList = [CP3A, CP3A, CP3B, CP3B];

const berthCodeList = ["HKLR-1", "HKLR-1", "HKLR-2", "HKLR-2"];

var dPoint1 = [
    [22.298806, 113.938138],
    [22.298793, 113.938195],
    [22.29829, 113.938095],
    [22.298295, 113.93798],
];

var dPoint2 = [
    [22.298883, 113.938165],
    [22.298858, 113.938219],
    [22.299347, 113.93839],
    [22.299339, 113.93835],
];

var dPoint3 = [
    [22.299704, 113.938532],
    [22.299674, 113.938567],
    [22.29931, 113.938366],
    [22.29931, 113.938337],
];

var dPoint4 = [
    [22.299771, 113.938581],
    [22.299749, 113.938626],
    [22.300111, 113.938846],
    [22.300168, 113.938843],
];

var dArea1 = L.polygon(dPoint1, {color: 'green'});
var dArea2 = L.polygon(dPoint2, {color: 'green'});
var dArea3 = L.polygon(dPoint3, {color: 'green'});
var dArea4 = L.polygon(dPoint4, {color: 'green'});

var dAreaList = [dArea1, dArea2, dArea3, dArea4];
var dAreaCodeList = ["HKLR-1-R", "HKLR-1-L", "HKLR-2-R", "HKLR-2-L"];

for (i=0; i<4; i++){

    berthList[i].bindPopup(berthCodeList[i]).setStyle({color: circleColor,fillColor: circleColor,fillOpacity: 1, radius:circleSize, className:'stop'});
    berthList[i].on('mouseover', function (e) {this.openPopup();});
    berthList[i].on('mouseout', function (e) {this.closePopup();});

    dAreaList[i].bindPopup(dAreaCodeList[i]);
    dAreaList[i].on('mouseover', function (e) {this.openPopup();});
    dAreaList[i].on('mouseout', function (e) {this.closePopup();});

    if (document.getElementById(i).innerHTML == 'Action'){
        document.getElementById(i).style.background = 'Red';
        document.getElementById(i).style.fontWeight = 1000;
        //berthList[i].setStyle({color: 'Red', fillColor: 'Red', className:'blinking'});
        berthList[i].addTo(map);
        dAreaList[i].setStyle({color: 'Red', className:'blinking'});
        dAreaList[i].addTo(map);
    }
    else if (document.getElementById(i).innerHTML == 'Alarm'){
        document.getElementById(i).style.background = 'DarkOrange';
        document.getElementById(i).style.fontWeight = 1000;
        //berthList[i].setStyle({color: 'DarkOrange', fillColor: 'DarkOrange', className:'blinking'});
        berthList[i].addTo(map);
        dAreaList[i].setStyle({color: 'DarkOrange', className:'blinking'});
        dAreaList[i].addTo(map);
    }
    else if (document.getElementById(i).innerHTML == 'Alert'){
        document.getElementById(i).style.background = 'Gold';
        document.getElementById(i).style.fontWeight = 1000;
        //berthList[i].setStyle({color: 'Gold', fillColor: 'Gold', className:'blinking'});
        berthList[i].addTo(map);
        dAreaList[i].setStyle({color: 'Gold', className:'blinking'});
        dAreaList[i].addTo(map);
    }
    else{
        berthList[i].addTo(map);
        berthList[i].bringToBack();
        dAreaList[i].addTo(map);
        dAreaList[i].bringToBack();
    }
}

// Get coordinates from map
// function onMapClick(e) {alert(e.latlng);}
// map.on('click', onMapClick);
