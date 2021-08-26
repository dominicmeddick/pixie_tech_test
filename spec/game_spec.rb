require 'game'
require 'player'

describe Game do 

  it 'declares a winner' do
    expect(subject.declare_winner).to eq "Player wins"
  end

  it 'the a player can pick a card' do
    allow(subject).to receive(hand).and_return(10)
    expect(subject.hand).to eq 10
  end

  it 'allows user to add players to the game' do
    player = Player.new
    expect(subject.add_player(player)).to eq [player]
  end

end
