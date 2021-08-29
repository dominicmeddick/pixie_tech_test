require 'game'
require 'player'

describe Game do 

  it 'adds players' do
    game = Game.new
    game.add_player("Dom")
    game.add_player("David")
    expect(game.players).not_to be nil
  end

  it ' doesnt allow the user to add more than 52 players' do
    game = Game.new
    52.times { expect(game.add_player("Dom")).to eq true }
    expect(game.add_player("David")).to eq false
  end

  # it 'decides how many cards to deal' do
  #   game = Game.new
  #   number = 5
  #   expect(game.set_number_of_cards(number)).to eq 5
  # end
end
