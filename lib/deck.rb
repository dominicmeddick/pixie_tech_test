require_relative 'card'

class Deck

  attr_accessor :SUITS

  @@SUITS = [:hearts, :spades, :diamonds, :clubs]

  def initialize
    @cards = @@SUITS.map { |suit| build(suit) }.flatten
  end

  # takes the deck built in the initialize and shuffles the deck
  def shuffle
    @cards.shuffle!
  end

  # returns all the suits in a deck
  def suits
    return @@SUITS
  end

  # this takes the card from the top of a deck
  def draw
    @cards.pop
  end

  # makes a copy of the cards array 
  def shallow_copy_cards
    @cards.dup
  end

  # gets the length of the cards array. This method is used for testing purposes
  def length
    @cards.length
  end

  private

  # builds the deck
  def build(suit)
    (1..13).map { |value| Card.new(value, suit) }
  end
end
