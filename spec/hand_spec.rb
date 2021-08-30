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

  it 'adds 40 points for a straight' do 
    hand.take_card(Card.new(7, :hearts))
    hand.take_card(Card.new(5, :hearts))
    hand.take_card(Card.new(6, :spades))
    hand.take_card(Card.new(4, :spades))
    hand.take_card(Card.new(3, :clubs))
    expect(hand.total_score).to eq 65
  end

  it 'adds 20 points for a three of a kind' do 
    hand.take_card(Card.new(7, :hearts))
    hand.take_card(Card.new(7, :diamonds))
    hand.take_card(Card.new(7, :spades))
    expect(hand.total_score).to eq 41
  end

  it 'adds 10 points for a pair' do 
    hand.take_card(Card.new(7, :hearts))
    hand.take_card(Card.new(7, :spades))
    expect(hand.total_score).to eq 24
  end

  it 'adds all bonus points' do 
    hand.take_card(Card.new(7, :hearts))
    hand.take_card(Card.new(5, :hearts))
    hand.take_card(Card.new(6, :spades))
    hand.take_card(Card.new(4, :spades))
    hand.take_card(Card.new(3, :clubs))
    hand.take_card(Card.new(7, :diamonds))
    hand.take_card(Card.new(7, :spades))
    hand.take_card(Card.new(10, :hearts))
    hand.take_card(Card.new(10, :diamonds))
    hand.take_card(Card.new(13, :diamonds))
    hand.take_card(Card.new(10, :spades))
    hand.take_card(Card.new(13, :diamonds))

    score = 0
    for card in hand.cards
      score += card.value
    end

    expect(hand.total_score).to eq (score + 40 + 20 + 10 + 10)
  end
end
