// Part of SQL Statement: SELECT umsatz_jahr, SUM(umsatz_umsatz)/COUNT(umsatz_firma) AS umsatz_umsatz, COUNT(umsatz_firma) AS counts FROM ...
// define hear the needed datasets
var years = [];
var revenue = [];
var companies = [];

//they have to have the same names as after select in the SQL query
for (const i in data) {
    years.push(data[i].umsatz_jahr);
    revenue.push(data[i].umsatz_umsatz);
    companies.push(data[i].counts);
}

var chartdata = {
    labels: years,
    datasets: [
        {
            label: 'Durchschnittlicher Umsatz',
            backgroundColor: 'rgba(181,158,133,0.75)',
            borderColor: 'rgba(181,158,133,0.75)',
            data: revenue,
            yAxisID: 'A'
        },
        {
            label: 'Anzahl Firmen',
            backgroundColor: 'rgba( 37, 55, 61,0.75)',
            borderColor: 'rgba( 37, 55, 61,0.75)',
            data: companies,
            yAxisID: 'B'
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
                ticks: {
                    min: 4,
                    max: 6
                }
            }, {
                id: 'B',
                type: 'linear',
                position: 'right',
                ticks: {
                    min: 4,
                    max: 6
                }
            }]
        }
    }
});