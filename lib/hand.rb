# frozen_string_literal: true

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
    @cards.each do |card|
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
    @cards.each do |card|
      total += card.value
    end
    sorted_cards = @cards.sort

    straights = get_straight(sorted_cards).reverse
    straights.each do |straight|
      total += 40
      sorted_cards.slice!(straight[0]..straight[1])
    end

    three_cards = get_num_of_a_kind(sorted_cards, 3)
    three_cards.each do |three|
      total += 20
      sorted_cards.slice!(three[0]..three[1])
    end

    pairs = get_num_of_a_kind(sorted_cards, 2)
    pairs.each do |pair|
      total += 10
      sorted_cards.slice!(pair[0]..pair[1])
    end

    total
  end

  private

  # Returns an array containing the start and end indices
  # of any straight found in the given usable_cards array
  def get_straight(usable_cards)
    indices = []

    return indices if usable_cards.length.zero?

    seq_count = 1
    prev = usable_cards[0].value

    (1...usable_cards.length).each do |i|
      curr = usable_cards[i].value
      if (curr - prev) == 1
        seq_count += 1
        indices << [i - 4, i] if seq_count == 5
      else
        seq_count = 1
      end
      prev = curr
    end

    indices
  end

  # Returns an array containing the start and end indices
  # of any num of a kind found in the given usable_cards array
  def get_num_of_a_kind(usable_cards, num)
    indices = []

    return indices if usable_cards.length.zero?

    kind_count = 1
    prev = usable_cards[0].value

    (1...usable_cards.length).each do |i|
      curr = usable_cards[i].value
      if curr == prev
        kind_count += 1
        indices << [i - (num - 1), i] if kind_count == num
      else
        kind_count = 1
      end
      prev = curr
    end

    indices
  end
end
