# frozen_string_literal: true

require_relative 'card'

# A collection of 52 cards that will be dealt out by the game
class Deck
  attr_accessor :SUITS

  @@SUITS = %i[hearts spades diamonds clubs]

  # Initializes an ordered deck of 52 cards
  def initialize
    @cards = @@SUITS.map { |suit| build(suit) }.flatten
  end

  # Shuffles the cards in the deck
  def shuffle
    @cards.shuffle!
  end

  # Returns suits in the order the deck ranks them
  def suits
    @@SUITS
  end

  # Removes the last card from the deck and returns it
  def draw
    @cards.pop
  end

  # Returns a shallow copy of the deck's cards array
  def shallow_copy_cards
    @cards.dup
  end

  # Returns the number of cards in the deck
  def length
    @cards.length
  end

  private

  # Builds the deck
  def build(suit)
    (1..13).map { |value| Card.new(value, suit) }
  end
end
