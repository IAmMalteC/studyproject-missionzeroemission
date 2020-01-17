$(document).ready(function(){
    $.ajax({
      url: "http://141.45.92.87/public/chartjs/phprequests/datarevenueall.php",
      method: "GET",
      success: function(data) {
        console.log(data);
        var years = [];
        var revenue = [];
  
        for(var i in data) {
          years.push(data[i].umsatz_jahr);
          revenue.push(data[i].umsatz_umsatz);
        }
  
        var chartdata = {
          labels: years,
          datasets : [
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
  
        var ctx = $("#datarevenueall");
  
        var barGraph = new Chart(ctx, {
          type: 'bar',
          data: chartdata
        });
      },
      error: function(data) {
        console.log(data);
      }
    });
  });