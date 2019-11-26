
 MissionZeroEmission
A tool to visaulize the emissions of the "Unternehmensnetzwerk Motzenerstraße"

 Hinweise für die Bearbeitung
  Elemente einbinden
Text Elemente wie Footer und header können eingebunden werden, sodass sie nicht auf jeder einzelnen Seite bearbeitet werden muss. Ein bisschen wie bei Objekten.

Eingebunden werden sie mit folgenden Schritten:
1. Save the HTML for the common elements of your site as separate files. For example, your navigation section might be saved as navigation.html or navigation.ssi.

2. Use the following SSI code to include that HTML document's code in each page.
- <!--#include virtual="navigation.ssi" -->
- or
- <!--#include file="footer_text.html" -->
- The include directive accepts two parameters. Virtual assumes that the filename is relative to the document root of the website, whereas file accepts an absolute file path.

3. Add this code on every page that you want to include the file.
Text

   CSS und JS

In den Dateien 00_css_from_motzener und 00_scripts_from_motzener sind die Scripte und Styles die auf der Motzener-Straße benutzt worden sind.