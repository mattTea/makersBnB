require 'space'
require 'user'

describe Space do
  let(:user) { double :user }

  describe '.create' do
    it 'can store a new space in the database' do
      user = User.create(
        name: "George",
        username: "georgie",
        email: "georgie@com",
        password: "password123"
      )
      space = Space.create(name: "Hilton", description: "Posh hotel", price: 100, start_date: '2019-04-10', end_date: '2019-04-17', user_id: user.id)

      expect(space).to be_a Space
      expect(space.name).to eq "Hilton"
      expect(space.description).to eq "Posh hotel"
      expect(space.price).to eq("$100.00")
      expect(space.start_date).to eq('2019-04-10')
      expect(space.end_date).to eq('2019-04-17')
    end
  end

  describe '.all' do
    it 'returns all spaces in the database' do
      user = User.create(
        name: "George",
        username: "georgie",
        email: "georgie@com",
        password: "password123"
      )
      Space.create(name: "Hilton", description: "Posh hotel", price: 100, start_date: '2019-04-10', end_date: '2019-04-17', user_id: user.id)
      Space.create(name: "Travelodge", description: "Less posh hotel", price: 50, start_date: '2019-04-10', end_date: '2019-04-17', user_id: user.id)
      Space.create(name: "Evelyn house", description: "Lovely place", price: 200, start_date: '2019-04-10', end_date: '2019-04-17', user_id: user.id)

      spaces = Space.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Space
      expect(spaces.first.name).to eq 'Hilton'
    end
  end
end
