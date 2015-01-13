// Dashboard donut

Morris.Donut({
  element: 'cost_donut',
  data: $('#cost_donut').data('costs'),
  resize: true,
  colors: ["#801515","#A8231E","#D46A6A","#FFAAAA"]
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
  [ { x: '2015-01-12', y1: 5,  y2: 4, y3: 7 },
    { x: '2015-01-13', y1: 7,  y2: 2, y3: 3 },
    { x: '2015-01-14', y1: 5,  y2: 4, y3: 6 },
    { x: '2015-01-15', y1: 6,  y2: 5, y3: 8 },
    { x: '2015-01-16', y1: 7,  y2: 5, y3: 10 }
  ],
  xkey: 'x',
  ykeys: ['y1', 'y2', 'y3'],
  labels: ['Opened', 'Due', 'Responded'],
  hideHover: 'auto',
  behaveLikeLine: true,
  resize: true,
  xLabelAngle: 60
});
