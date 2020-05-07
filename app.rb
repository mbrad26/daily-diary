require 'sinatra/base'

class Diary < Sinatra::Base

  get '/' do
    'Hello World!'
  end

  get '/entries' do
    erb :'/entries/index'
  end

  post '/entries' do
    redirect '/entries/new'
  end

  get '/entries/new' do
    erb :'/entries/new'
  end

  post '/entries/new' do
    redirect '/entries'
  end

  run! if app_file == $0
end
