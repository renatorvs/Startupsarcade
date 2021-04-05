// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart1");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Outros (31%)", "Provedor (33%)", "Empolgado (16)", "Desbravador (20)"],
    datasets: [{
      data: [31, 33, 20, 16],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#86b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#86b9cc'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: true
    },
    cutoutPercentage: 80,
  },
});
// Pie Chart Example
var ctx = document.getElementById("myPieChart2");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Apaixonado (24%)", "Independente (25%)", "Outros (20%)", "Antenado (17%)", "Arrojado (14%)"],
    datasets: [{
      data: [24, 33, 20, 16, 14],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#86b9cc', '#ff0000'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf', '#86b9cc', '#ff0000'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: true
    },
    cutoutPercentage: 80,
  },
});
