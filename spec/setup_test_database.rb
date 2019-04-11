require 'pg'

p "setting up test database"

def setup_test_database
  connection = PG.connect(dbname: 'pinkbnb_test')

  connection.exec("TRUNCATE spaces, users, requests;")
end
