require 'game'

describe Game do 

  it 'declares a winner' do
    expect(subject.declare_winner).to eq "Player wins"
  end

end
