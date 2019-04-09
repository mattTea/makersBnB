describe("Space", function() {
  it("captures space name", function() {
    var space = new Space;
    space.addName("Fancy place in Kensington");
    expect(space.name).toEqual("Fancy place in Kensington");
  });

  it("captures space description", function() {
    var space = new Space;
    space.addDescription("Some funny description");
    expect(space.description).toEqual("Some funny description");
  });

  it("captures space price per night", function() {
    var space = new Space;
    space.addPrice(100);
    expect(space.price).toEqual(100);
  });

});