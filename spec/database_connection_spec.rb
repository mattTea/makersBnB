require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets a connetion to the database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'pinkbnb_test')

      DatabaseConnection.setup('pinkbnb_test')
    end

    it 'has a persistent connection' do
      connection = DatabaseConnection.setup('pinkbnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end

  end

  describe '.query' do
    it 'runs an SQL query via PG' do
      connection = DatabaseConnection.setup('pinkbnb_test')

      expect(connection).to receive(:exec).with('SELECT * FROM spaces;')

      DatabaseConnection.query('SELECT * FROM spaces;')
    end
  end
end