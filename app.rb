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

  post '/user_input' do
    player_1 = Player.new(params[:player_1]).name
    player_2 = Player.new(params[:player_2]).name
    card_number = params[:card_number].to_i
    game = Game.new
    game.add_player(player_1)
    game.add_player(player_2)
    game.set_number_of_cards(card_number)
    session[:game] = game
    redirect '/winner'
  end

  get '/winner' do
    game = session[:game]
    game.deal_cards
    @winner_name = game.decide_winner

    erb :winner
  end

  run! if app_file == $0
end
