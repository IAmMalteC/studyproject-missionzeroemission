
# MissionZeroEmission
A tool to visaulize the emissions of the "Unternehmensnetzwerk Motzenerstraße"

## Hinweise für die Bearbeitung
### Elemente einbinden
Text Elemente wie Footer und header können eingebunden werden, sodass sie nicht auf jeder einzelnen Seite bearbeitet werden muss. Ein bisschen wie bei Objekten.

Eingebunden werden sie mit folgenden Schritten:
1. Save the HTML for the common elements of your site as separate files. For example, your navigation section might be saved as navigation.html.

2. Use the following code to include that HTML document's code in each page.
<div>
  <iframe src="navigation.html" onload="this.before((this.contentDocument.body||this.contentDocument).children[0]);this.remove()"></iframe>
</div>

3. Add this code on every page that you want to include the file.
### CSS und JS

In den Dateien 00_css_from_motzener und 00_scripts_from_motzener sind die Scripte und Styles die auf der Motzener-Straße benutzt worden sind.