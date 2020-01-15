//This searches for the acitve Link
$(document).ready(function () {
    var element = $('meta[name="active-menu"]').attr('content');
    $('#' + element).addClass('active');
});

//Makes the menu to an hamburger menu
function makeHamburgerMenu() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}

// function showMonthOrYear() {
//     var e = document.getElementById("Ablesung");
//     var zeitraum = e.options[e.selectedIndex].value;

//     var x = document.getElementsByClassName("ZeitraumMonat");
//     var i;
//     for (i = 0; i < x.length; i++) {
//       if (zeitraum == "jaehrlich") {
//         x[i].style.display = "none";
//       } else {
//         x[i].style.display = "inline";
//       }
//     }
//   }
