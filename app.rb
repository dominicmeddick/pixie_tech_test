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
    if session.key?(:game) == false
      session[:game] = Game.new
    end
    session[:game].add_player(params[:player_name])
    redirect '/'
  end

  post '/card_input' do
    if session.key?(:game) == false
      session[:log_message] = "You need to enter a player"
      redirect '/'
    end
    card_number = params[:card_number].to_i
    if card_number == 0
      session[:log_message] = "You need to enter a number greater than 0"
      redirect '/'
    end
    is_valid = session[:game].set_number_of_cards(card_number)
    if is_valid
      redirect '/winner'
    else 
      session[:log_message] = "You've entered an impossible combination of cards and players"
      redirect '/'
    end
  end

  get '/winner' do
    session[:game].deal_cards
    @winner_name = session[:game].decide_winner

    erb :winner
  end

  run! if app_file == $0
end
