$(document).ready(function() {
  $('#to-field').select2({
    placeholder: 'Select a recipient',
    allowClear: true
  });

  $('#cc-field').select2({
    placeholder: 'Select team members to copy'
  });
});
