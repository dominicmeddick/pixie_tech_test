require 'deck'

describe Deck do

  it 'contains 52 cards' do
    deck = Deck.new
    cards = deck.shallow_copy_cards

    card_index = 0 
    for suit in deck.suit do
      for value in range (1..13)
        expect(cards.card_index).to eq value, suit
        card_index += 1
      end
    end
  end

  it 'checks that cards are shuffled' do
    deck = Deck.new
    ordered_cards = deck.shallow_copy_cards
    expect(deck.shuffle).not_to eq ordered_cards
  end

  # it 'draws a card' do
  #   card = Deck.new.draw
  #   expect(card.value).to eq 5
  #   expect(card.suit).to eq :spades
  # end

  # it 'shuffles a card' do
  #   card = Deck.new.draw
  #   expect(card.value).to eq 5
  #   expect(card.suit).to eq :spades
  # end


  # Once I call shuffle the cards aren't in the same order as before
  # I need a method that prints an array with the cards
  # Call that method after the cards are shuffled
  # compare the before and after to make sure they're different

  # deck = Deck.new
  # deck must contain 52 cards in the array

  #

  
end