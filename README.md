
# MissionZeroEmission
A tool to visaulize the emissions of the "Unternehmensnetzwerk Motzenerstraße"

## Elemente einbinden
Text Elemente wie Footer und header können eingebunden werden, sodass sie nicht auf jeder einzelnen Seite bearbeitet werden muss. Ein bisschen wie bei Objekten.

Eingebunden werden sie mit folgenden Schritten:
1. Save the HTML for the common elements of your site as separate files. For example, your navigation section might be saved as navigation.

2. Use the following code to include that HTML document's code in each page.
```
<%- include('./partials/topnavigation'); -%>
```

3. Add this code on every page that you want to include the file.

## Charts
Zu jedem Chart gibt es **ein** Script, das liegt unter ./chartjs/jsforcharts und folgt der Namenskovention. Als weiters Script wird Chart.js benötigt.
CSS sollte am Ende im stylesheet definert werden.
In ihnen wird die jeweilige chart per ID angesprochen. Die entpsrechend auf der HTML Seite zu finden ist.

Die Charts folgen einer selbst festgelegten **Namenskonvention**:
1. they all start with "chartfor"
2. if needed followed by the type of data, like
..*electricity
..*and so on
3. about whom, like
..*all
..*branch
..*company
4. which **can** be followed by specialty, like 
..*average

## Tooltip
add Tooltips by writing data-tooltip="YOUR TEXT" to the div/object which should get a tooltip
Beispiel:
```
<h1 data-tooltip="Tooltip">&Uuml;berschrift</h1>
```
