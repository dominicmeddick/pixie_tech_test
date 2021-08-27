require 'card'

describe Card do


  it 'checks that a card has a value and a suit' do
    card = Card.new(5, :spades)
    expect(card).to have_attributes(value: 5, suit: spades)
  end
 
end