require 'hand'

describe Hand do

  it 'puts a card into a players hand' do
    hand = Hand.new
    card = Card.new(6, :clubs)
    hand.take_card(card)
    expect(hand.cards).to include card
  end

  it 'calculates the score of the hand' do
    hand = Hand.new
    card = Card.new(6, :clubs)
    card2 = Card.new(2, :hearts)
    card3 = Card.new(8, :spades)

    hand.take_card(card)
    hand.take_card(card2)
    hand.take_card(card3)

    expect(hand.total_score).to eq 16

  end
end
