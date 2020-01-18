// // Part of SQL Statement: SELECT umsatz_tb.umsatz_jahr, SUM(umsatz_tb.umsatz_umsatz) AS umsatz_umsatz, branche_tb.branche_name FROM ...
// // define hear the needed datasets
// var years = [];
// var revenue = [];
// var testingBranches = [];

// //they have to have the same names as after select in the SQL query
// //first we need to determine the differnt amount of branches
// var amountOfBranches = 0;
// var counterOfRounds = 0;
// for (const i in data) {
//     if (testingBranches[i] != data[i].branche_name) {
//         amountOfBranches++
//     }
//     testingBranches.push(data[i].branche_name);
//     counterOfRounds++
// }
// var averager = counterOfRounds / amountOfBranches;
// //With the following method we just get two branches which is perfect
// var branch = [];
// for (const j = 0; j < counterOfRounds;) {
//     branch.push(data[j].branche_name);
//     j = j + averager;
// }
// // Now we push the data for year, but we just push it to the end of the first branch.
// for (const k = 0; k < averager; k++) {
//     years.push(data[k].umsatz_jahr);
// }
// // Now push data to revenue by adding it to the chartdata
// for (const l = 0; l < averager; l++) {
//     revenue.push(data[l].umsatz_umsatz);
// }

lineChartData = {}; //declare an object
lineChartData.labels = []; //add 'labels' element to object (X axis)
lineChartData.datasets = []; //add 'datasets' array element to object

for (line = 0; line < 2; line++) {
    y = [];
    lineChartData.datasets.push({}); //create a new line dataset
    dataset = lineChartData.datasets[line]
    dataset.fillColor = "rgba(0,0,0,0)";
    dataset.strokeColor = "rgba(200,200,200,1)";
    dataset.data = []; //contains the 'Y; axis data

    for (x = 0; x < 10; x++) {
        y.push(line + x); //push some data aka generate 4 distinct separate lines
        if (line === 0)
            lineChartData.labels.push(x); //adds x axis labels
    } //for x

    lineChartData.datasets[line].data = y; //send new line data to dataset
} //for line

ctx = document.getElementById("revenueBranch");
myLineChart = new Chart(ctx).Line(lineChartData);

// var chartdata = {
//     labels: years,
//     datasets: [
//         {
//             label: branch[i],
//             backgroundColor: 'rgba(200, 200, 200, 0.75)',
//             borderColor: 'rgba(200, 200, 200, 0.75)',
//             hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
//             hoverBorderColor: 'rgba(200, 200, 200, 1)',
//             data: revenue,
//         }
//     ]
// };

// var ctx = document.getElementById('revenueBranch');
// var myChart = new Chart(ctx, {
//     type: 'line',
//     data: chartdata,
//     options: {
//         responsive: true,
//         tooltips: {
//             mode: 'index',
//             intersect: false,
//         },
//         hover: {
//             mode: 'nearest',
//             intersect: true
//         },
//         scales: {
//             yAxes: [{
//                 id: 'A',
//                 type: 'linear',
//                 position: 'left',
//             }, {
//                 id: 'B',
//                 type: 'linear',
//                 position: 'right'
//             }]
//         }
//     }
// });