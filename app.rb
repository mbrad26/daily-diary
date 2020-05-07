require 'sinatra/base'
require './lib/entries'

class Diary < Sinatra::Base

  get '/' do
    'Hello World!'
  end

  get '/entries' do
    @result = Entries.all
    p @result
    erb :'/entries/index'
  end

  post '/entries' do
    redirect '/entries/new'
  end

  get '/entries/new' do
    erb :'/entries/new'
  end

  post '/entry' do
    p params['add_entry']
    p params[:add_entry]
    p params
    Entries.create(body: params['add_entry'])
    redirect '/entries'
  end

  run! if app_file == $0
end
