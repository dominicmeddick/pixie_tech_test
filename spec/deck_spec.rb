require 'deck'

describe Deck do

  it 'contains 52 cards' do
    deck = Deck.new
    cards = deck.shallow_copy_cards

    card_index = 0 
    for x in deck.suits do
      for y in (1..13)
        expect(cards[card_index].value).to eq y
        expect(cards[card_index].suit).to eq x
        card_index += 1
      end
    end
  end

  it 'checks that cards are shuffled' do
    deck = Deck.new
    ordered_cards = deck.shallow_copy_cards
    shuffled_deck = deck.shuffle
    expect(shuffled_deck).not_to eq ordered_cards
  end

  #test is failing. The expect contains incorrect logic
  it 'takes a card from the top of the shuffled deck' do
    deck = Deck.new
    card = Card.new(4, suit)
    shuffled_deck = deck.shuffle
    expect(shuffled_deck.draw.value).to eq card.value
  end
end
