require 'sinatra/base'
require 'sinatra/reloader'
require './lib/game'

class Poker < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/select' do
    redirect '/winner'
  end

  # get '/winner' do
  #   erb: winner
  # end

  run! if app_file == $0
end
