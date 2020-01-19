// NEMO Gesamt Durchschnit mit
// res_strom_regulaer_jahr
// nemo_strom_regulaer_jahresverbrauch,
// gesamt_photov_jahresverbrauch,
// nemo_strom_gesamtemission,
// nemo_strom_emissionseinsparung,
// nemo_strom_gesamtemission_theoretisch,
// nemo_gesamtumsatz,
// nemo_umsatz_pro_emission
// anzahl_firmen
//Siehe auch SQL_statements.txt
// define hear the needed datasets
var years = [];
var emElectronicReal = [];
var emElectronicTheory = [];
var revenue = [];
var revenuePerEm = [];

//they have to have the same names as after select in the SQL query
for (const i in data) {
    years.push(data[i].res_strom_regulaer_jahr);
    emElectronicReal.push(data[i].nemo_strom_gesamtemission);
    emElectronicTheory.push(data[i].nemo_strom_gesamtemission_theoretisch);
    revenue.push(data[i].nemo_gesamtumsatz);
    revenuePerEm.push(data[i].nemo_umsatz_pro_emission);
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
        }, {
            label: 'Emissionen ohne Einsparung',
            backgroundColor: 'rgba(181,140,133,0.75)',
            borderColor: 'rgba(181,140,133,0.75)',
            yAxisID: 'A',
            data: emElectronicTheory
        }, {
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

var ctx = document.getElementById('emissionAllAverage');
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
            }]
        }
    }
});

var ctx = document.getElementById('emissionPrEmissionAllAverage');
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
        }
    }
});