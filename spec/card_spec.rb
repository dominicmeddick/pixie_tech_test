require 'card'

describe Card do

  it 'checks that a card has a value and a suit' do
    card = Card.new(5, :spades)
    expect(card.value).to eq 5
    expect(card.suit).to eq :spades
  end

end


