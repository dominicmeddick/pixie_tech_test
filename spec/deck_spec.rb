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
    expect(deck.length).to eq 52
  end

  it 'checks that cards are shuffled' do
    deck = Deck.new
    ordered_cards = deck.shallow_copy_cards
    shuffled_deck = deck.shuffle
    expect(shuffled_deck).not_to eq ordered_cards
  end

  it 'takes a card from the top of the deck' do
    deck = Deck.new
    deck_length = deck.length
    expect(deck.draw).not_to equal nil
    expect(deck.length).to eq (deck_length -1)
  end

end
