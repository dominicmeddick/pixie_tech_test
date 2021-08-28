require 'game'
require 'player'

describe Game do 

  it 'adds players' do
    game = Game.new
    player = Player.new("Dom")
    player2 = Player.new("David")
    game.add_player(player)
    game.add_player(player2)
    expect(game.players).not_to be nil
  end

  it 'decides how many cards to deal' do
    game = Game.new
    number = 5
    expect(game.set_number_of_cards(number)).to eq 5
  end
end
