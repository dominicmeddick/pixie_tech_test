require 'hand'

describe Hand do

  it 'puts a card into a players hand' do
    hand = Hand.new
    card = Card.new(6, :clubs)
    hand.take_card(card)
    expect(hand.cards).to include card
  end

  # it 'calculates the score of the hand' do
  #   hand = Hand.new
  #   deck = Deck.new
  #   5.times { hand.take_card(deck) }
  #   expect(hand.total_score).to 
  # end

end