require 'hand'

describe Hand do

  let(:hand) { Hand.new }

  it 'puts a card into a players hand' do
    card = Card.new(6, :clubs)
    hand.take_card(card)
    expect(hand.cards).to include card
  end

  it 'calculates the score of the hand' do
    card = Card.new(6, :clubs)
    card2 = Card.new(2, :hearts)
    card3 = Card.new(8, :spades)

    hand.take_card(card)
    hand.take_card(card2)
    hand.take_card(card3)

    expect(hand.total_score).to eq 16
  end

  it 'sorts a players hand after dealing, using card suit followed by value' do
    player_hand = []
    player_hand << Card.new(6, :hearts)
    player_hand << Card.new(4, :hearts)
    player_hand << Card.new(9, :spades)
    player_hand << Card.new(8, :spades)
    player_hand << Card.new(7, :clubs)
    player_hand << Card.new(5, :clubs)
    player_hand << Card.new(6, :diamonds)
    player_hand << Card.new(4, :diamonds)
    controller_hand = player_hand.dup
    player_hand.shuffle!
    for card in player_hand do 
      hand.take_card(card)
    end
    hand.sort_cards

    expect(hand.cards).to eq controller_hand
  end
end
