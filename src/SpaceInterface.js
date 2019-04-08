$(document).ready(function() {

  var space = new Space();
  
  $('#name').text(space.name);

  $('#submit-name').click(function() {
    space.addName($('#space-name').val());
    $('#name').text(space.name);
  });

})