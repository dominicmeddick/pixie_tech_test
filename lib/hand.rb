require_relative 'deck'

class Hand

  def initialize
    @cards = []
  end

  def take_card(deck)
    @cards << deck.draw
  end

  def hand_size
    @cards.length
  end

end