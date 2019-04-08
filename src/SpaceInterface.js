$(document).ready(function() {

  var space = new Space();
  
  $('#name').text(space.name);
  $('#description').text(space.description);

  $('#submit-name').click(function() {
    space.addName($('#space-name').val());
    $('#name').text(space.name);
  });

  $('#submit-description').click(function() {
    space.addDescription($('#space-description').val());
    $('#description').text(space.description);
  });

})