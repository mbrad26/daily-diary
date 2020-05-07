require 'entries'

describe Entries do

  describe '.all' do
    it 'returns all the entries in the database' do
      entry = Entries.create(body: 'A usual day at Makers', title: 'Makers')
      Entries.create(body: 'Just another day at Makers', title: 'Makers next')

      entries = Entries.all

      expect(entries.length).to eq 2
      expect(entries.first).to be_a Entries
      expect(entries.first.id).to eq entry.id
      expect(entries.first.title).to eq 'Makers'
      expect(entries.first.body).to eq 'A usual day at Makers'
    end
  end

  describe '.create' do
    it 'creates a new entry' do
      entry = Entries.create(body: 'Great day today at Makers', title: 'Entry title')

      connection = PG.connect(dbname: 'diary_test')
      result = connection.exec("SELECT * FROM entries WHERE id = #{entry.id};")

      expect(entry).to be_a Entries
      expect(entry.id).to eq result.first['id']
      expect(entry.body).to eq 'Great day today at Makers'
      expect(entry.title).to eq 'Entry title'
    end
  end

  describe '.find' do
    it 'given an id it returns an entry from the database' do
      entry = Entries.create(body: 'Another Makers day', title: 'Makers')

      result = Entries.find(id: entry.id)

      expect(result).to be_a Entries
      expect(result.id).to eq entry.id
      expect(result.title).to eq 'Makers'
      expect(result.body).to eq 'Another Makers day'
    end
  end
end
