require 'request'

describe "Request" do
  describe ".create" do
    it "stores a request" do
      # create a user
      host_user = User.create(
        name: "George",
        username: "georgie",
        email: "georgie@com",
        password: "password123"
      )
      # create a space
      space = Space.create(name: "Hilton", description: "Posh hotel", price: 100, user_id: host_user.id)
      # create guest user
      guest_user = User.create(
        name: "Evelyn",
        username: "evelyn",
        email: "evelyn@com",
        password: "password1"
      )
      p guest_user.id
      p space.id
      request = Request.create(user_id: guest_user.id, space_id: space.id, date: "11th April")
      expect(request).to be_a Request
    end
  end
end