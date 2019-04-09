require 'space'

describe Space do
  describe '.create' do
    it 'can store a new space in the database' do
      space = Space.create(name: "Hilton", description: "Posh hotel", price: 100)

      expect(space).to be_a Space
      expect(space.name).to eq "Hilton"
      expect(space.description).to eq "Posh hotel"
      expect(space.price).to eq("$100.00")
    end
  end

  describe '.all' do
    it 'returns all spaces in the database' do
      Space.create(name: "Hilton", description: "Posh hotel", price: 100)
      Space.create(name: "Travelodge", description: "Less posh hotel", price: 50)
      Space.create(name: "Evelyn house", description: "Lovely place", price: 200)

      spaces = Space.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Space
      expect(spaces.first.name).to eq 'Hilton'
    end
  end
end
