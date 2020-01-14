var emission = new Array();
emission.push('100');
emission.push('80');
emission.push('70');
emission.push('63');
emission.push('60');
emission.push('57');
emission.push('55');
var umsatz = new Array();
umsatz.push('100');
umsatz.push('95');
umsatz.push('90');
umsatz.push('85');
umsatz.push('70');
umsatz.push('80');
umsatz.push('85');
var emissionumsatz = new Array();
var ergebnis;
for (var i= 0; i < emission.length; i++)
{
    ergebnis = emission[i] / umsatz[i] * 100;
    emissionumsatz.push(ergebnis)
}


var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['2014', '2015', '2016', '2017', '2018', '2019', '2020'],
        datasets: [{
            label: 'CO2-Emissionen',
            data: emission,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2
        }, {
            label: 'Umsatz',
            data: umsatz,
            backgroundColor: [
                'rgba(255, 206, 86, 0.2)'
            ],
            borderColor: [
                'rgba(255, 206, 86, 1)'
            ],
            borderWidth: 2
        }, {
            label: unescape('CO2-Emissionen in Abh%E4ngigkeit zum Umsatz'),
            data: emissionumsatz,
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Jahr'
                }
            }],
            yAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Prozent'
                },
                ticks: {
                    beginAtZero: true,
                    suggestedMax: 100,
                    stepSize: 10
                }
            }]
        }
    }
});