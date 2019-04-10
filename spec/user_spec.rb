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
end
