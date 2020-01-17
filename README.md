
# MissionZeroEmission
A tool to visaulize the emissions of the "Unternehmensnetzwerk Motzenerstraße"

## Hinweise für die Bearbeitung
### Elemente einbinden
Text Elemente wie Footer und header können eingebunden werden, sodass sie nicht auf jeder einzelnen Seite bearbeitet werden muss. Ein bisschen wie bei Objekten.

Eingebunden werden sie mit folgenden Schritten:
1. Save the HTML for the common elements of your site as separate files. For example, your navigation section might be saved as navigation.

2. Use the following code to include that HTML document's code in each page.
```
<%- include('./partials/header'); -%>
```

3. Add this code on every page that you want to include the file.
### CSS und JS

In den Dateien 00_css_from_motzener und 00_scripts_from_motzener sind die Scripte und Styles die auf der Motzener-Straße benutzt worden sind.
### Charts
Die Charts folgen einer selbst festgelegten Namenskonvention:
1. they all start with data, because that is what we get from them.
2. followed by the type of data, like
..* revenue
..* co2
....*just from electricity and so on
3. about whom, like
..*all
..*branch
..*company
4. which **can** be followed by specialty, like 
..*average
