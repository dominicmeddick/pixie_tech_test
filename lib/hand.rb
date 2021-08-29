require_relative 'deck'

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  # puts a card into a players hand
  def take_card(card)
    @cards << card
  end

  #calculates the total score of a hand
  def total_score
    total = 0
    for card in @cards do
      total += card.value
    end 
    return total
  end
end
