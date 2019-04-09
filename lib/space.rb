require 'pg'

class Space

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'pinkbnb_test')
    else
      connection = PG.connect(dbname: 'pinkbnb')
    end
    result = connection.exec("INSERT INTO spaces (name, description, price_per_night) VALUES ('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price_per_night;")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price_per_night'])
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'pinkbnb_test')
    else
      connection = PG.connect(dbname: 'pinkbnb')
    end
    result = connection.exec("SELECT * FROM spaces;")
    result.map do |space|
      Space.new(
        id: space['id'],
        name: space['name'],
        description: space['description'],
        price: space['price_per_night']
      )
    end
  end

end
