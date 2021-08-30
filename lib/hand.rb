require_relative 'card'

# A collection of cards held by a player
class Hand

  attr_reader :cards

  # Initializes an empty hand
  def initialize
    @cards = []
  end

  # Adds the given card into the hand
  def take_card(card)
    @cards << card
  end

  # Sorts the cards in the hand in descending order
  def sort_cards
    hearts = []
    spades = []
    clubs = []
    diamonds = []

    # Sort each card into its corresponding suit array
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

    # Cards need to be in descending order, so sort
    # then reverse the arrays 
    hearts.sort!.reverse!
    spades.sort!.reverse!
    clubs.sort!.reverse!
    diamonds.sort!.reverse!

    # Combine all suit arrays in order
    @cards = hearts + spades + clubs + diamonds
  end

  # Returns the total score of the hand by adding up
  # the value of each card and then adding bonus points
  # (40 for a straight, 20 for a three of a kind, 10 for a pair)
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

    three_cards = get_num_of_a_kind(sorted_cards, 3)
    for three in three_cards do
      total += 20
      sorted_cards.slice!(three[0]..three[1])
    end

    pairs = get_num_of_a_kind(sorted_cards, 2)
    for pair in pairs do 
      total += 10
      sorted_cards.slice!(pair[0]..pair[1])
    end

    return total
  end

  private

  # Returns an array containing the start and end indices
  # of any straight found in the given usable_cards array
  def get_straight(usable_cards)
    indices = []

    if (usable_cards.length == 0)
      return indices
    end
    
    seq_count = 1
    prev = usable_cards[0].value
    
    for i in (1...usable_cards.length)
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

  # Returns an array containing the start and end indices
  # of any num of a kind found in the given usable_cards array
  def get_num_of_a_kind(usable_cards, num)
    indices = []

    if (usable_cards.length == 0)
      return indices
    end

    kind_count = 1
    prev = usable_cards[0].value

    for i in (1...usable_cards.length)
      curr = usable_cards[i].value
      if curr == prev 
        kind_count += 1
        if kind_count == num
          indices << [i - (num - 1), i]
        end
      else
        kind_count = 1
      end
      prev = curr
    end

    return indices
  end
end
