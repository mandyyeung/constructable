$(document).ready(function(){
  $('#results th a').on("click", function(){
    $.getScript(this.href);
    return false;
  });
});
