require 'deck'

describe Deck do

  it 'draws a card' do
    card = Deck.new.draw
    expect(card.value).to eq 5
    expect(card.suit).to eq :spades
  end
  
end