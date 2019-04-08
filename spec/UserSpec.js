describe("User", function() {
  it("creates a user with signup attributes", function() {
    var user = new User({name: "Amy Jordan", username: "amyj", email: "amy@test.com", password: "password123"})

    expect(user.name).toEqual("Amy Jordan")
    expect(user.username).toEqual("amyj")
    expect(user.email).toEqual("amy@test.com")
    expect(user.password).toEqual("password123")
  });
});
