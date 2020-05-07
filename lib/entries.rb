class Entries
  def self.all
    connection = PG.connect(dbname: 'diary_test')

    result = connection.exec("SELECT * FROM entries;")
    result.map { |entry| entry['body'] }
  end
end
