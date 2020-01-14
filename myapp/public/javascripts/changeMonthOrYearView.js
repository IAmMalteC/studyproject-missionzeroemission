document.getElementById("Ablesung").addEventListener("change", showMonthOrYear);

function showMonthOrYear() {
  var e = document.getElementById("Ablesung");
  var zeitraum = e.options[e.selectedIndex].value;

  var x = document.getElementsByClassName("ZeitraumMonat");
  var i;
  for (i = 0; i < x.length; i++) {
    if (zeitraum == "jaehrlich") {
      x[i].style.display = "none";
    } else {
      x[i].style.display = "inline";
    }
  }
}
