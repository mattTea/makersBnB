describe("Space", function() {
  it("captures space name", function() {
    var space = new Space;
    space.addName("Fancy place in Kensington");
    expect(space.name).toEqual("Fancy place in Kensington");
  });
});