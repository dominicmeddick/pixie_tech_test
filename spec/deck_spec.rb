require 'deck'

describe Deck do

  it 'draws a card' do
    card = Card.new(5, :spades)
    expect(card.draw.value).to eq 5
  end
  
end