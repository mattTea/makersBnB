class Space

  attr_reader :id, :name, :description, :price, :start_date, :end_date, :user_id

  def initialize(id:, name:, description:, price:, start_date:, end_date:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @end_date = end_date
    @user_id = user_id
  end

  def self.create(name:, description:, price:, start_date:, end_date:, user_id:)
    result = DatabaseConnection.query(
      "INSERT INTO spaces (name, description, price_per_night, user_id, start_date, end_date)
      VALUES ('#{name}', '#{description}', '#{price}', '#{user_id}', '#{start_date}', '#{end_date}')
      RETURNING id, name, description, price_per_night, user_id, start_date, end_date;"
    )
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price_per_night'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date'],
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
        start_date: space['start_date'],
        end_date: space['end_date'],
        user_id: space['user_id']
      )
    end
  end

end
