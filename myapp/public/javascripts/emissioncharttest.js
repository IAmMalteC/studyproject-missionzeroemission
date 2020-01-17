$(document).ready(function () {

    var years = [];
    var revenue = [];

    for (var i in data) {
        years.push(data[i].umsatz_jahr);
        revenue.push(data[i].umsatz_umsatz);
    }

    var chartdata = {
        labels: years,
        datasets: [
            {
                label: 'Revenue',
                backgroundColor: 'rgba(200, 200, 200, 0.75)',
                borderColor: 'rgba(200, 200, 200, 0.75)',
                hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
                hoverBorderColor: 'rgba(200, 200, 200, 1)',
                data: revenue
            }
        ]
    };

    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: years,
            datasets: [{
                label: 'Umsatz',
                yAxisID: 'A',
                data: revenue,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 2
            }]
        },
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
            // scales: {
            //     xAxes: [{
            //         display: true,
            //         scaleLabel: {
            //             display: true,
            //             labelString: 'Jahr'
            //         }
            //     }],
            //     yAxes: [{
            //         id: 'A',
            //         display: true,
            //         scaleLabel: {
            //             display: true,
            //             labelString: 'CO2-Emissionen in Prozent'
            //         },
            //         ticks: {
            //             beginAtZero: true,
            //             suggestedMax: 100,
            //             stepSize: 10
            //         }
            //     }, {
            //         id: 'B',
            //         display: true,
            //         position: 'right',
            //         scaleLabel: {
            //             display: true,
            //             labelString: 'Umsatz in Prozent'
            //         },
            //         ticks: {
            //             beginAtZero: true,
            //             suggestedMax: 100,
            //             stepSize: 10
            //         }
            //     }]
            // }
        }
    });
});