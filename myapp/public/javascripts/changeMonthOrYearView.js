document.getElementById("Ablesung").addEventListener("change", showMonthOrYear);  

function showMonthOrYear() {
  var e  = document.getElementById("Ablesung");
  var zeitraum = e.options[e.selectedIndex].value;
  if (zeitraum == "jaehrlich") {
    document.getElementById("ZeitraumMonat").style.display = "none";
  }
  if (zeitraum == "monatlich") {
    document.getElementById("ZeitraumMonat").style.display = "inline";
  }
}
