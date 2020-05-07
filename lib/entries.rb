require 'pg'

class Entries
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end
    result = connection.exec("SELECT * FROM entries;")
    result.map { |entry| entry['body'] }
  end

  def self.create(body:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end

    connection.exec("INSERT INTO entries (body) VALUES('#{body}');")
  end
end
