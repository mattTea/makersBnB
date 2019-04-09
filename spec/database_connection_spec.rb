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
end