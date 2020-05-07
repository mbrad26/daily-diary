require 'sinatra/base'
require 'pg'

class Diary < Sinatra::Base

  get '/' do
    'Hello World!'
  end

  get '/entries' do
    connection = PG.connect(dbname: 'diary_test')
    @result = connection.exec("SELECT * FROM entries;")
    erb :'/entries/index'
  end

  post '/entries' do
    redirect '/entries/new'
  end

  get '/entries/new' do
    erb :'/entries/new'
  end

  post '/entries/new' do
    entry = params['add_entry']
    connection = PG.connect(dbname: 'diary_test')
    connection.exec("INSERT INTO entries (body) VALUES('#{entry}');")
    redirect '/entries'
  end

  run! if app_file == $0
end
