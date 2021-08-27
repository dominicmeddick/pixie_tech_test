require_relative 'card'

class Deck

  def initialize
    @cards = [Card.new(5, :spades)]
  end

  def draw
    @cards.pop
  end

end