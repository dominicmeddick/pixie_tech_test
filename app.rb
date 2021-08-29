require 'sinatra/base'
require 'sinatra/reloader'
require './lib/game'

class Poker < Sinatra::Base
  enable :sessions
  
  configure :development do
    register Sinatra::Reloader
  end

  run! if app_file == $0

end