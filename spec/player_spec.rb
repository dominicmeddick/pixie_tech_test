require 'player'

describe Player do

  it 'adds a name' do
    player = Player.new
    player.enter_name("Dom")
    expect(player).to eq "Dom"
  end


end