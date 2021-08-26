require 'game'
require 'player'

describe Game do 

  subject(:game) { described_class.new(player_1, player_2) }
  let(:player_1) { double :player }
  let(:player_2) { double :player }

  it 'declares a winner' do
    expect(subject.declare_winner).to eq "Player wins"
  end

  it 'the a player can pick a card' do
    expect(player_1.hand).to eq "10"
  end

end
