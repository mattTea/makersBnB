$(document).ready(function() {

  var space = new Space();
  
  $('#name').text(space.name);
  $('#description').text(space.description);

  $('#submit-new-space').click(function() {
    space.addName($('#space-name').val());
    $('#name').text(space.name);
    space.addDescription($('#space-description').val());
    $('#description').text(space.description);
    space.addPrice($('#space-price-per-night').val());
    $('#price-per-night').text(`£${space.price}`);
  });
})