require_relative 'card'

class Deck

  attr_accessor :SUITS

  @@SUITS = [:hearts, :spades, :diamonds, :clubs]

  def initialize
    @cards = @@SUITS.map { |suit| build(suit) }.flatten
  end

  def shuffle
    @cards.shuffle!
  end

  def suits
    return @@SUITS
  end

  #this takes the card from the top of a deck
  def draw
    @cards.pop
  end

  def shallow_copy_cards
    @cards.dup
  end

  def length
    @cards.length
  end

  private

  def build(suit)
    (1..13).map { |value| Card.new(value, suit) }
  end
end
