// Part of SQL Statement:  SELECT `res_strom_regulaer_id`, `res_strom_regulaer_firma`, 
//`res_strom_regulaer_jahr`, `res_strom_regulaer_jahresverbrauch`, 
//res_strom_photov_tb.res_strom_photov_jahresverbrauch,  AS strom_gesamtemission,  
//AS strom_emissionseinsparung,  AS strom_gesamtemission_theoretisch, 
//umsatz_tb.umsatz_umsatz,  AS umsatz_pro_emission FROM  ...
// define hear the needed datasets
var years = [];
var emElectronicReal = [];
var emElectronicTheory = [];
var revenue = [];
var revenuePerEm = [];

//they have to have the same names as after select in the SQL query
for (const i in data) {
    years.push(data[i].res_strom_regulaer_jahr);
    emElectronicReal.push(data[i].strom_gesamtemission);
    emElectronicTheory.push(data[i].strom_gesamtemission_theoretisch);
    revenue.push(data[i].umsatz_umsatz);
    revenuePerEm.push(data[i].umsatz_pro_emission);
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

var ctx = document.getElementById('emissionCompany');
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
            }, {
              id: 'B',
              type: 'linear',
              position: 'right',
            }]
        }
    }
});

var ctx = document.getElementById('revenuePrEmissionCompany');
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