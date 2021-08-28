require 'hand'

describe Hand do

  it 'puts a card into a players hand' do
    hand = Hand.new
    deck = Deck.new
    hand.take_card(deck)
    expect(hand.hand_size).to eq 1
  end

  # it 'calculates the score of the hand' do
  #   get
  # end

end