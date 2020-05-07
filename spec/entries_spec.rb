require 'entries'

describe Entries do

  describe '.all' do
    it 'returns all the entries in the database' do
      connection = PG.connect(dbname: 'diary_test')

      connection.exec("INSERT INTO entries (body) VALUES('A usual day at Makers');")
      connection.exec("INSERT INTO entries (body) VALUES('Just another day at Makers');")

      expect(Entries.all).to include 'A usual day at Makers'
      expect(Entries.all).to include 'Just another day at Makers'
    end
  end

  describe '.create' do
    it 'creates a new entry' do
      Entries.create(body: 'Great day today at Makers')

      expect(Entries.all).to include 'Great day today at Makers'
    end
  end
end
