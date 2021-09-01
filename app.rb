# frozen_string_literal: true

require 'sinatra'
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

  # Called when user submits a new player name
  post '/player_input' do
    session[:game] = Game.new if session.key?(:game) == false

    # Add a player with the submitted name to the game
    session[:game].add_player(params[:player_name])

    # Redirect to same page so that more players can be added
    redirect '/'
  end

  # Called when user sets number of cards to deal
  # and tries to start game
  post '/card_input' do
    if session.key?(:game) == false
      session[:log_message] = 'You need to enter a player'
      redirect '/'
    end

    card_number = params[:card_number].to_i
    if card_number.zero?
      session[:log_message] = 'You need to enter a number greater than 0'
      redirect '/'
    end

    is_valid = session[:game].set_num_cards_per_player(card_number)
    if is_valid
      # Play game by redirecting to next page
      redirect '/winner'
    else
      # Redirect to same page so that a different number of cards can be set
      session[:log_message] = "You've entered an impossible combination of cards and players"
      redirect '/'
    end
  end

  get '/winner' do
    game = session[:game]
    game.deal_cards
    game.sort_players_cards
    @winner_name = game.decide_winner

    erb :winner
  end

  run! if app_file == $PROGRAM_NAME
end
