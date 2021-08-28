require_relative 'deck'

class Hand

  def initialize
    @cards = []
  end

  def hand_size
    @cards.length
  end

end