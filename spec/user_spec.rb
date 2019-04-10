require 'user'

describe User do

  describe "#create" do
    it('creates a new user') do
      user = User.create(name: 'Person1', username: 'person1',
        email: 'person1@test.com', password: 'password1')

      expect(user.name).to eq 'Person1'
      expect(user.username).to eq 'person1'
      expect(user.email).to eq 'person1@test.com'
    end

    it 'encrypts the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password1')

      user = User.create(name: 'Person1', username: 'person1',
        email: 'person1@test.com', password: 'password1')
    end
  end

  describe "#all" do
    it('displays all users') do
      User.create(name: 'Person1', username: 'person1',
        email: 'person1@test.com', password: 'password1')

      expect(User.all[0].name).to eq 'Person1'
    end
  end

  describe "#find" do
    it "retrieves a user given an id" do
      user = User.create(name: 'Matt', username: 'matt1',
        email: 'matt1@test.com', password: 'password1')
      result = User.find(id: user.id)
      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end

    it "returns nil if no id given" do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe "#authenticate" do
    it "returns a user given a correct username, if one exists" do
      user = User.create(name: 'Matt', username: 'matt1',
        email: 'matt1@test.com', password: 'password1')

      authenticated_user = User.authenticate(username: 'matt1', password: 'password1')
      expect(authenticated_user.id).to eq user.id
    end
  end
end
