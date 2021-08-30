require_relative 'card'

class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  # puts a card into a players hand
  def take_card(card)
    @cards << card
  end

  def sort_cards
    hearts = []
    spades = []
    clubs = []
    diamonds = []
    for card in @cards do
      case card.suit
      when :hearts 
        hearts << card
      when :spades 
        spades << card
      when :clubs 
        clubs << card
      when :diamonds
        diamonds << card
      end
    end
    hearts.sort!.reverse!
    spades.sort!.reverse!
    clubs.sort!.reverse!
    diamonds.sort!.reverse!
    @cards = hearts + spades + clubs + diamonds
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
