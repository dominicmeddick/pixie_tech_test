require 'game'
require 'player'

describe Game do 

  it 'declares a winner' do
    expect(subject.declare_winner).to eq "Player wins"
  end

  it 'the a player can pick a card' do
    expect(subject.hand).to eq "10"
  end

  it 'allows for two players' do
    expect(subject.add_player.length).to eq 2
  end

end
