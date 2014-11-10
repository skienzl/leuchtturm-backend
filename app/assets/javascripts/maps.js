/**
 * Created by stefankienzl on 27/10/14.
 */
var markersArray = [];

function initialize() {
    if (document.getElementById("map_canvas")) {
        var mapOptions = {
            center: new google.maps.LatLng(46.62543, 14.31136),
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);

        if (map) {
            loadMarker(map);
        }
    }
}

function loadMarker(map) {
     clearMar();
    if(endsWith("/new")){
        google.maps.event.addListener(map, 'click', function(event) {
            clearMar();
            onMapClick(map, event.latLng);
        });
    }else{
        showZones(map);
    }

}

function showZones(map){
    var url = document.URL;
    if(endsWith("/edit")) {
        url = url.substring(0, url.length-5);
    }
    $.getJSON(url + ".json", function( json ) {
        if(json.hasOwnProperty('harbor')){
            for(var i = 0; i < json.harbor.zones.length; i++){
                addMarker(map, json.harbor.zones[i], false);
            }
        }else{
            addMarker(map, json, true);
        }
        centerMarker(map);
    });
}

function clearMar(){
    for (var i = 0; i < markersArray.length; i++ ) {
        markersArray[i].setMap(null);
    }
    markersArray.length = 0;
}

function addMarker(map, zone, isDraggable){
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(zone.lat,zone.lon),
        map: map,
        draggable:isDraggable,
        title: zone.name
    });


    google.maps.event.addListener(marker, 'dragend', function() { updateMarker(marker); } );

    markersArray.push(marker);
}

function centerMarker(map){
    if(markersArray.length > 1) {
        var latlngbounds = new google.maps.LatLngBounds();
        for (var i = 0; i < markersArray.length; i++) {
            latlngbounds.extend(markersArray[i].getPosition());
        }
        map.setCenter(latlngbounds.getCenter());
        map.fitBounds(latlngbounds);
    }else{
        map.setCenter(markersArray[0].getPosition());
        map.setZoom(13);
    }
}

function updateMarker(marker){
   /* var data_patch ='{"zone":{"lat" : '+marker.position.lat()+', "lon" : '+marker.position.lng()+'}}';
    var url = document.URL;
    if(endsWith("/edit")) {
        url = url.substring(0, url.length-5);
    }
    $.ajax({
        type: "PATCH",
        url: url + ".json",
        data: data_patch,
        contentType: "application/json; charset=utf-8",
        accept: "application/json",
        dataType: "json",
        success: function() {
            $('#zone_lat').val(marker.position.lat());
            $('#zone_lon').val(marker.position.lng());
        },
        failure: function(errMsg) {
            alert(errMsg);
        }
    });*/
    $('#zone_lat').val(marker.position.lat());
    $('#zone_lon').val(marker.position.lng());
}

function onMapClick(map, position) {
    var marker = new google.maps.Marker({
        position: position,
        map: map,
        draggable: true,
        title: "new zone"
    });
    setLatLng(position);
    google.maps.event.addListener(marker, 'dragend', function() { setLatLng(marker.getPosition()); } );
    markersArray.push(marker);
}


function setLatLng(position){
     $('#zone_lat').val(position.lat());
     $('#zone_lon').val(position.lng());
}

function endsWith(ending){
      return (document.URL.indexOf(ending, document.URL.length - ending.length) !== -1);
}


$(document).on('page:change', initialize);
$(document).on('page:ready', initialize);