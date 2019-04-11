class Request
  attr_reader :user_id, :space_id, :date
  
  def initialize(id:, user_id:, space_id:, date:)
    @user_id = user_id
    @space_id = space_id
    @date = date
  end

  def self.create(user_id:, space_id:, date:)
    result = DatabaseConnection.query(
      "INSERT INTO requests (user_id, space_id, date)
      VALUES ('#{user_id}', '#{space_id}', '#{date}')
      RETURNING id, user_id, space_id, date;"
    )
    Request.new(
      id: result[0]['id'],
      user_id: result[0]['user_id'],
      space_id: result[0]['space_id'],
      date: result[0]['date']
    )
  end
end