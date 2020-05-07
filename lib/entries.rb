require 'pg'

class Entries

  attr_reader :id, :body, :title

  def initialize(id:, body:, title:)
    @id = id
    @body = body
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end
    result = connection.exec("SELECT * FROM entries;")
    result.map do |entry|
      Entries.new(id: entry['id'], body: entry['body'], title: entry['title'])
    end
  end

  def self.create(body:, title:)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'diary_test')
    else
      connection = PG.connect(dbname: 'diary')
    end

    result = connection.exec("INSERT INTO entries (body, title) VALUES('#{body}', '#{title}') RETURNING id, body, title;")
    Entries.new(id: result[0]['id'], body: result[0]['body'], title: result[0]['title'])
  end
end
