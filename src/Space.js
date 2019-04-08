function Space() {
  this.name = "";
}

Space.prototype = {
  constructor: Space,
  addName: function(name) {
    this.name = name;
  }
}