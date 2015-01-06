// Dashboard donut

Morris.Donut({
  element: 'cost_donut',
  data: $('#cost_donut').data('costs'),
  resize: true,
  hideHover: 'auto',
  colors: ["#933B39","#C05F5D","#D18B89"]
});

// Dashboard bar

Morris.Bar({
  element: 'trade_bar',
  data: $('#trade_bar').data('trades'),
  xkey: 'x',
  ykeys: ['y'],
  xLabelMargin: 10,
  labels: ['RFI Count'],
  hideHover: 'auto',
  resize: true
});

// Dashboard line

Morris.Line({
  element: 'dates_line',
  data: $('#dates_line').data('dates'),
  xkey: 'x',
  ykeys: ['y'],
  labels: ['# of RFIs'],
  hideHover: 'auto',
  behaveLikeLine: true,
  resize: true
});
