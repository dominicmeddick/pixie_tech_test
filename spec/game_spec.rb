require 'game'
require 'player'

describe Game do 

  it 'declares a winner' do
    expect(subject.declare_winner).to eq "Player wins"
  end

  it 'the a player can pick a card' do
    expect(subject.hand).to eq "10"
  end

  it 'retrieves the first player' do
    expect(game.player_1). to eq player_1
  end

end
