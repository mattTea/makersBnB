class Space

  attr_reader :id, :name, :description, :price, :user_id

  def initialize(id:, name:, description:, price:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end

  def self.create(name:, description:, price:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price_per_night, user_id)
      VALUES ('#{name}', '#{description}', '#{price}', '#{user_id}')
      RETURNING id, name, description, price_per_night, user_id;"
    )
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price_per_night'],
      user_id: result[0]['user_id']
    )
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces;")
    result.map do |space|
      Space.new(
        id: space['id'],
        name: space['name'],
        description: space['description'],
        price: space['price_per_night'],
        user_id: space['user_id']
      )
    end
  end

end
