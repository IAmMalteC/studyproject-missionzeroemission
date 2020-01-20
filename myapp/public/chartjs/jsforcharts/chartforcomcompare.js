// GESAMT BRANCHENÜBERSICHT, also Gesamtverbrauch/ -emission pro Branche und Jahr.
// Namen der Spalten
// Jahr: `res_strom_regulaer_jahr`,
// gesamt_strom_regulaer_jahresverbrauch,
// gesamt_photov_jahresverbrauch,
// branche_strom_gesamtemission,
// branche_gesamtumsatz,
// branche_tb.branche_name,
//Siehe auch SQL_statements.txt
// define hear the needed datasets
var years = [];
var emElectronicReal = [];
//var emElectronicTheory = [];
var revenue = [];
var revenuePerEm = [];

//they have to have the same names as after select in the SQL query
for (const i in data) {
    years.push(data[i].res_strom_regulaer_jahr);
    emElectronicReal.push(data[i].branche_strom_gesamtemission);
    //emElectronicTheory.push(data[i].strom_gesamtemission_theoretisch);
    revenue.push(data[i].branche_gesamtumsatz);
    revenuePerEm.push(data[i].branche_gesamtumsatz/data[i].branche_strom_gesamtemission);
}

var chartdata = {
    labels: years,
    datasets: [
        {
            label: 'Reale Emissionen',
            backgroundColor: 'rgba( 42, 72, 52,0.75)',
            borderColor: 'rgba( 42, 72, 52,0.75)',
            yAxisID: 'A',
            data: emElectronicReal
        }, 
        // {
        //     label: 'Emissionen ohne Einsparung',
        //     backgroundColor: 'rgba(181,140,133,0.75)',
        //     borderColor: 'rgba(181,140,133,0.75)',
        //     yAxisID: 'A',
        //     data: emElectronicTheory
        // },
         {
            label: 'Umsatz',
            backgroundColor: 'rgba( 37, 55, 61,0.75)',
            borderColor: 'rgba( 37, 55, 61,0.75)',
            yAxisID: 'B',
            data: revenue
        }
    ]
};
var chartdataRevenuePrEmission = {
    labels: years,
    datasets: [
        {
            label: 'Umsatz pro Emission',
            backgroundColor: 'rgba( 37, 55, 61,0.75)',
            borderColor: 'rgba( 37, 55, 61,0.75)',
            data: revenuePerEm
        }
    ]
};

var ctx = document.getElementById('emissionCompanyCompareBranch');
var myChart = new Chart(ctx, {
    type: 'line',
    data: chartdata,
    options: {
        responsive: false,
        tooltips: {
            mode: 'index',
            intersect: false,
        }, hover: {
            mode: 'nearest',
            intersect: true                
        }, scales: {
            yAxes: [{
              id: 'A',
              type: 'linear',
              position: 'left',
              ticks: {
                beginAtZero: true
              }
            }, {
              id: 'B',
              type: 'linear',
              position: 'right',
              ticks: {
                beginAtZero: true
              }
            }]
        }
    }
});

var ctx = document.getElementById('revenuePrEmisssionCompanyCompareBranch');
var myChart = new Chart(ctx, {
    type: 'line',
    data: chartdataRevenuePrEmission,
    options: {
        responsive: false,
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true                
        }, scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
        }, legend: {
            display: false
        }
    }
});