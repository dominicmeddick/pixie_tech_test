require 'player'

describe Player do

  it 'adds a name' do
    player = Player.new("Dom")
    expect(player.name).to eq "Dom"
  end


end
