function Space() {
  this.name = "TBD";
  this.description = "TBD";
  this.price = 0;
}

Space.prototype = {
  constructor: Space,
  addName: function(name) {
    this.name = name;
  },
  addDescription: function(description) {
    this.description = description;
  },

  addPrice: function(price) {
    this.price = price;
  }

}