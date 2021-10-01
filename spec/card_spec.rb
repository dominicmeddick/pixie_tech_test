# frozen_string_literal: true

require 'card'

describe Card do
  it 'has a value and a suit' do
    card = Card.new(5, :spades)
    expect(card.value).to eq 5
    expect(card.suit).to eq :spades
  end

  it 'converts the real value and suit of a card to a string' do
    card = Card.new(11, :diamonds)
    card_string = card.to_string
    expect(card_string).to eq 'Jack of Diamonds'
  end
end
