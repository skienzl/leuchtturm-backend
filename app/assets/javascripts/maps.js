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
     showRegions(map);
}

function showRegions(map){
    $.getJSON( document.URL + ".json", function( json ) {
        if(json.hasOwnProperty('harbor')){
            for(var i = 0; i < json.harbor.regions.length; i++){
                addMarker(map, json.harbor.regions[i], false);
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

function addMarker(map, region, isDraggable){
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(region.lat,region.lon),
        map: map,
        draggable:isDraggable,
        title: region.name
    });


    google.maps.event.addListener(marker, 'dragend', function() { markerDragend(marker); } );

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

function markerDragend(marker){
    var data_patch ='{"region":{"lat" : '+marker.position.lat()+', "lon" : '+marker.position.lng()+'}}';
    $.ajax({
        type: "PATCH",
        url: document.URL + ".json",
        data: data_patch,
        contentType: "application/json; charset=utf-8",
        accept: "application/json",
        dataType: "json",
        failure: function(errMsg) {
            alert(errMsg);
        }
    });
}

$(document).on('page:change', initialize);
$(document).on('page:ready', initialize);