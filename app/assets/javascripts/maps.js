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
                addMarker(map, json.harbor.regions[i]);
            }
        }else{
            addMarker(map, json);
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

function addMarker(map, region){
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(region.lat,region.lon),
        map: map,
        draggable:true,
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
    //alert(marker.position.lat() + " / " +marker.position.lng());
}

$(document).on('page:change', initialize);
$(document).on('page:ready', initialize);