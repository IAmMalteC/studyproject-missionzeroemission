// Part of SQL Statement: SELECT umsatz_tb.umsatz_jahr, SUM(umsatz_tb.umsatz_umsatz) AS umsatz_umsatz, branche_tb.branche_name FROM ...
// define hear the needed datasets
var years = [];
var revenue = [];
var testingBranches = [];

//they have to have the same names as after select in the SQL query
//first we need to determine the differnt amount of branches
var amountOfBranches = 0;
var counterOfRounds = 0;
for (var i in data){
    if (testingBranches[i] != data[i].branche_name){
        amountOfBranches++
    }
    testingBranches.push(data[i].branche_name);
    counterOfRounds++
}
var averager = counterOfRounds/amountOfBranches;
//With the following method we just get two branches which is perfect
var branch = [];
for (const i = 0; i < counterOfRounds; ){
    branch.push(data[i].branche_name);
    i = i+averager;
}
// Now we push the data for year and revenue
array.forEach(e => {
    years.push(data[e].umsatz_jahr);
    revenue.push(data[e].umsatz_umsatz);
});
for (var i in data) {
    years.push(data[i].umsatz_jahr);
    revenue.push(data[i].umsatz_umsatz);
}

var chartdata = {
    labels: years,
    datasets: [
        {
            for (let index = 0; index < array.length; index++) {
                const element = array[index];
                
            }
            label: branch[i],
            backgroundColor: 'rgba(200, 200, 200, 0.75)',
            borderColor: 'rgba(200, 200, 200, 0.75)',
            hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
            hoverBorderColor: 'rgba(200, 200, 200, 1)',
            data: revenue,
            yAxisID:'A'
        }
    ]
};

var ctx = document.getElementById('revenueAllAverage');
var myChart = new Chart(ctx, {
    type: 'line',
    data: chartdata,
    options: {
        responsive: true,
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true                
        },
        scales: {
            yAxes: [{
              id: 'A',
              type: 'linear',
              position: 'left',
            }, {
              id: 'B',
              type: 'linear',
              position: 'right'
            }]
        }
    }
});