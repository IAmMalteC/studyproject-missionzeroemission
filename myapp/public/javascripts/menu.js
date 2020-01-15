//This searches for the acitve Link
$(document).ready(function () {
    var element = $('meta[name="active-menu"]').attr('content');
    $('#' + element).addClass('active');
});

//Makes the menu to an hamburger menu
function classToggle() {
    const navs = document.querySelectorAll('.Navbar__Items')

    navs.forEach(nav => nav.classList.toggle('Navbar__ToggleShow'));
}

document.querySelector('.Navbar__Link-toggle')
        .addEventListener('click', classToggle);
