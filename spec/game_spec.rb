require 'game'
require 'player'

describe Game do 

  let(:game) { Game.new }

  it 'adds players' do
    game.add_player("Dom")
    game.add_player("David")
    expect(game.players).not_to be nil
  end

  it ' doesnt allow the user to add more than 52 players' do
    52.times { expect(game.add_player("Dom")).to eq true }
    expect(game.add_player("David")).to eq false
  end

  it 'decides how many cards to deal' do
    game.add_player("Dom")
    expect(game.set_number_of_cards(52)).to eq true
  end

end
