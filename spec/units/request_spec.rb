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
      space = Space.create(name: "Hilton", description: "Posh hotel", price: 100, user_id: host_user.id, start_date: '2019-04-10', end_date: '2019-04-17')
      # create guest user
      guest_user = User.create(
        name: "Evelyn",
        username: "evelyn",
        email: "evelyn@com",
        password: "password1"
      )
      request = Request.create(user_id: guest_user.id, space_id: space.id, date: "2019-04-11")
      expect(request).to be_a Request
    end
  end

  describe ".all_by_user" do
    it "returns all requests for a specific user" do
      host_user = User.create(
        name: "George",
        username: "georgie",
        email: "georgie@com",
        password: "password123"
      )

      space = Space.create(name: "Hilton", description: "Posh hotel", price: 100, user_id: host_user.id, start_date: '2019-04-10', end_date: '2019-04-17')

      guest_user = User.create(
        name: "Evelyn",
        username: "evelyn",
        email: "evelyn@com",
        password: "password1"
      )
      Request.create(user_id: guest_user.id, space_id: space.id, date: "2019-04-12")
      Request.create(user_id: guest_user.id, space_id: space.id, date: "2019-04-13")

      requests = Request.all_by_user(user_id: host_user.id)
      expect(requests.length).to eq 2
      expect(requests.first.space_id).to eq space.id
    end
  end
end
