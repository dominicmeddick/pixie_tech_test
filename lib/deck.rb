require_relative 'card'

class Deck

  def initialize
    @cards = [Card.new(5, :spades), Card.new(3, :spades)].shuffle
  end

  def length
    return @cards.length
  end

  #this takes the card from the top of the shuffled deck
  def draw
    @cards.pop
  end

  def shallow_copy_cards
    @cards.dup
  end

end