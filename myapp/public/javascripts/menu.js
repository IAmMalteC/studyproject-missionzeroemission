// Searches for the acitve Link and adds a class for Css
$(document).ready(function () {
    var element = $('meta[name="active-menu"]').attr('content');
    $('#' + element).addClass('active');
});

