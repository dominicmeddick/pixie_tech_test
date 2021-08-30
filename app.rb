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

  post '/player_input' do
    player = params[:player_name]
    if session.key?(:players) == false
      session[:players] = []
    end
    session[:players] << player
    redirect '/'
  end

  post '/card_input' do
    session[:card_number] = params[:card_number].to_i
    redirect '/winner'
  end

  get '/winner' do
    game = Game.new
    for player in session[:players]
      game.add_player(player)
    end
    game.set_number_of_cards(session[:card_number])
    game.deal_cards
    @winner_name = game.decide_winner

    erb :winner
  end

  run! if app_file == $0
end
