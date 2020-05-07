require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'diary_test')

  connection.exec("TRUNCATE entries;")
end
