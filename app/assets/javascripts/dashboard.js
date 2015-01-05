// Dashboard donut

Morris.Donut({
  element: 'donut',
  data: [
    {label: "Increase", value: 12},
    {label: "Decrease", value: 30},
    {label: "Unknown", value: 20}
  ],
  resize: true,
  hideHover: 'auto',
  colors: ["#933B39","#C05F5D","#D18B89"]
});

// Dashboard line

Morris.Line({
  element: 'dates-line',
  data: $('#dates-line').data('dates'),
  xkey: 'created_at',
  ykeys: ['id'],
  labels: ['Id'],
  hideHover: 'auto',
  behaveLikeLine: true,
  resize: true
})

// Dashboard bar

Morris.Bar({
  element: 'bar',
  data: [
    { y: 'Core & Shell', a: 75 },
    { y: 'MEP', a: 50 },
    { y: 'Interiors', a: 75 },
    { y: 'Site', a: 100 }
  ],
  xkey: 'y',
  ykeys: ['a'],
  xLabelMargin: 10,
  labels: ['Total'],
  hideHover: 'auto',
  resize: true
});
