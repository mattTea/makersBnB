require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('pinkbnb_test')
else
  DatabaseConnection.setup('pinkbnb')
end