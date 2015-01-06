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
  data:
  // $('#dates_line').data('dates'),
  [
    { x: '2015-01-10', y1: 10, y2: 9, y3: 7 },
    { x: '2015-01-11', y1: 5,  y2: 6, y3: 8 },
    { x: '2015-01-12', y1: 1,  y2: 4, y3: 7 },
    { x: '2015-01-13', y1: 7,  y2: 2, y3: 3 },
    { x: '2015-01-14', y1: 5,  y2: 4, y3: 6 },
    { x: '2015-01-15', y1: 6,  y2: 5, y3: 8 },
    { x: '2015-01-16', y1: 7, y2: 5, y3: 10 }
  ],
  xkey: 'x',
  ykeys: ['y1', 'y2', 'y3'],
  labels: ['Open', 'Due', 'Responded'],
  hideHover: 'auto',
  behaveLikeLine: true,
  resize: true,
  xLabelAngle: 60
});
