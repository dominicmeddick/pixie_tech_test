require_relative 'deck'

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def take_card(card)
    @cards << card
  end

  def hand_size
    @cards.length
  end

end