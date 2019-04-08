function Space() {
  this.name = "TBD";
  this.description = "TBD";
}

Space.prototype = {
  constructor: Space,
  addName: function(name) {
    this.name = name;
  },
  addDescription: function(description) {
    this.description = description;
  },

}