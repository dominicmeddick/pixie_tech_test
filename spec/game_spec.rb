require 'game'

describe Game do 

  it 'declares a winner' do
    expect(player.declare_winner).to eq "Player wins"
  end
  
end