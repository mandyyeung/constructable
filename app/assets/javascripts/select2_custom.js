$(document).ready(function() {
  $('#to-field').select2({
    placeholder: 'Select a recipient',
    allowClear: true
  });

  $('#cc-field').select2({
    placeholder: 'Select a team mate to copy'
  });
});
