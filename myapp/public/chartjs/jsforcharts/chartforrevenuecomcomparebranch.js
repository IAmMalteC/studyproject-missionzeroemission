// Part of SQL Statement: SELECT umsatz_tb.umsatz_jahr, SUM(umsatz_tb.umsatz_umsatz)/COUNT(umsatz_firma) AS umsatz_umsatz, branche_tb.branche_name FROM umsatz_tb
// define hear the needed datasets
var years = [];
var revenue = [];

//they have to have the same names as after select in the SQL query
for (const i in data) {
    years.push(data[i].umsatz_jahr);
    revenue.push(data[i].umsatz_umsatz);
}

var chartdata = {
    labels: years,
    datasets: [
        {
            label: 'Umsatz',
            backgroundColor: 'rgba(200, 200, 200, 0.75)',
            borderColor: 'rgba(200, 200, 200, 0.75)',
            hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
            hoverBorderColor: 'rgba(200, 200, 200, 1)',
            data: revenue
        }
    ]
};

var ctx = document.getElementById('revenueCompanyCompareBranch');
var myChart = new Chart(ctx, {
    type: 'line',
    data: chartdata,
    options: {
        responsive: false,
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
                ticks: {
                    min: 4,
                    max: 6
                }
            }]
        }
    }
});