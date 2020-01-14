document.getElementById("Ablesung").addEventListener("change", showMonthOrYear);  

function showMonthOrYear() {
  var e  = document.getElementById("Ablesung");
  var zeitraum = e.options[e.selectedIndex].value;
  if (zeitraum == "jaehrlich") {
    document.getElementsByClassName("ZeitraumMonat").style.display = "none";
  }
  else {
    document.getElementsByClassName("ZeitraumMonat").style.display = "inline";
  }
}
