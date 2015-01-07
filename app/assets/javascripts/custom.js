$(document).ready(function(){
  // $('#results th a').on("click", function(){
  //   $.getScript(this.href);
  //   return false;
  // });
  $('.label').each(function(){
    var $this = $(this),
        classToAdd = null;
    switch ($this.text()){
      case 'Draft':
        classToAdd = 'label-info';
        break;
      case 'Open':
        classToAdd = 'label-success';
        break;
      case 'Closed':
        classToAdd = 'label-primary';
        break;
      case 'Re-Opened':
        classToAdd = 'label-warning';
        break;
      case 'Void':
        classToAdd = 'label-default';
        break;
      case 'Field Impact':
        classToAdd = 'label-danger';
        break;
    }
    if (classToAdd !== null){
      $this.addClass(classToAdd);
    }
  });

  $('.comment').last().addClass('bottom');

  function toggle(value){
    return value ? 'addClass':'removeClass';
  }

  $(document).on('input', '.clearable', function() {
    $(this)[toggle(this.value)]('x');
  }).on('mousemove', '.x', function(e) {
    $(this)[toggle(this.offsetWidth-28 < e.clientX-this.getBoundingClientRect().left)]('onX');
  }).on('click', '.onX', function(){
    $(this).removeClass('x onX').val('').change();
  });

});
