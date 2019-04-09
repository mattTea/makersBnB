require 'pg'

class User
  attr_reader :name, :username, :email, :password

  def initialize(id:, name:, username:, email:, password:)
    @id = id
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def self.create(name:, username:, email:, password:)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'pinkbnb_test')
    else
      connection = PG.connect(dbname: 'pinkbnb')
    end
    result = connection.exec(
      "INSERT INTO users (name, username, email, password)
      VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
      RETURNING id, name, username, email, password;"
    )
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      username: result[0]['username'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'pinkbnb_test')
    else
      connection = PG.connect(dbname: 'pinkbnb')
    end
    result = connection.exec("SELECT * FROM users;")
    result.map do |user|
      User.new(
        id: user['id'],
        name: user['name'],
        username: user['username'],
        email: user['email'],
        password: user['password']
      )
    end

  end
end
