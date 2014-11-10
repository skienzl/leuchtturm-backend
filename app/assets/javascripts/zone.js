/**
 * Created by stefankienzl on 31/10/14.
 */

function setOnTechnologyListener() {
    if (document.getElementById("zone_technology")) {
        $('#zone_technology').change(function () {
            updateTechnologyOption();
        });
        updateTechnologyOption();
    }
}

function updateTechnologyOption() {
    var technology_id = $('#zone_technology').val();

    switch (technology_id) {
        case "0":
            //GPS
            setFieldsVisible(true, false, false, false, true);
            break;
        case "1":
            //BEACON
            setFieldsVisible(true, true, true, true, false);
            break;
        case "2":
            //NFC
            setFieldsVisible(false, true, false, false, false);
            break;
        case "3":
            //QR
            setFieldsVisible(false, true, false, false, false);
            break;
        default:
            setFieldsVisible(false, false, false, false, false);
    }
}

function setFieldsVisible(accuracy_visibel, identifier_visible, minor_visible, major_visible, shape_visible) {
    setVisibel($('#zone_accuracy'), accuracy_visibel);
    setVisibel($('#zone_identifier'), identifier_visible);
    setVisibel($('#zone_minor'), minor_visible);
    setVisibel($('#zone_major'), major_visible);
    setVisibel($('#zone_shape'), shape_visible);
}

function setVisibel(field, isVisible) {
    var parent = field.parent();

    if (isVisible) {
        parent.removeClass("hide");
    } else {
        parent.addClass('hide');
    }
}


$(document).on('page:change', setOnTechnologyListener);
$(document).on('page:ready', setOnTechnologyListener);