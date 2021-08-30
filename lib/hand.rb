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

  # calculates the total score of a hand
  def total_score
    total = 0
    for card in @cards do
      total += card.value
    end 
    sorted_cards = @cards.sort

    straights = get_straight(sorted_cards).reverse
    for straight in straights do 
      total += 40
      sorted_cards.slice!(straight[0]..straight[1])
    end
    return total
  end

  def get_straight(usable_cards)
    seq_count = 1
    prev = usable_cards[0].value
    indices = []
    for i in (1...@cards.length)
      curr = usable_cards[i].value
      if (curr - prev) == 1
        seq_count += 1
        if seq_count == 5
          indices << [i - 4, i]
        end
      else
        seq_count = 1
      end
      prev = curr
    end

    return indices
  end
end
