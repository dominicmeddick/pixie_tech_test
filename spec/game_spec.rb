require 'game'
require 'player'

describe Game do 

  let(:game) { Game.new }

  it 'adds players' do
    game.add_player("Dom")
    game.add_player("David")
    expect(game.players).not_to be nil
  end

  it ' prevents the user from adding more than 52 players' do
    52.times { expect(game.add_player("Dom")).to eq true }
    expect(game.add_player("David")).to eq false
  end

  it 'decides how many cards to deal' do
    game.add_player("Dom")
    expect(game.set_number_of_cards(52)).to eq true
  end

  it 'prevents the user from adding an an impossible combination of players and cards' do
    game.add_player("Dom")
    expect(game.set_number_of_cards(54)).to eq false
  end

  it 'prevents the game from being played with 0 cards' do
    game.add_player("Dom")
    expect(game.set_number_of_cards(0)).to eq false
  end

  it 'prevents the user from entering an invalid name' do 
    expect(game.add_player(" ")).to eq false
  end

  it 'deals cards into the a single players hand' do 
    game.add_player("Dom")
    game.set_number_of_cards(52)
    game.deal_cards
    expect(game.players[0].hand.cards.length).to eq 52
  end



end
