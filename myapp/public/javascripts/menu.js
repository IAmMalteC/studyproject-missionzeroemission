//This searches for the acitve Link
$(document).ready(function () {
    var element = $('meta[name="active-menu"]').attr('content');
    $('#' + element).addClass('active');
});

