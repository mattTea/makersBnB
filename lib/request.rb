class Request
  attr_reader :id, :user_id, :space_id, :date

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

  def self.all_by_user(user_id:)
    result = DatabaseConnection.query("SELECT requests.id, requests.date, requests.space_id, requests.user_id FROM requests
      JOIN spaces ON (spaces.id=space_id) JOIN users
      ON (spaces.user_id=users.id) WHERE (users.id='#{user_id}');")
    result.map do |request|
        Request.new(
        id: request['id'],
        user_id: request['user_id'],
        space_id: request['space_id'],
        date: request['date']
      )
    end
  end
end
