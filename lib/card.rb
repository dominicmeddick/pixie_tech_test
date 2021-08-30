class Card

  attr_reader :value, :suit

  include Comparable

  @@card_names = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  # concerts the value and suits of a single card
  def to_s
    "#{@@card_names[value - 1]} of #{@suit.to_s.capitalize}"
  end

  # deteremines which card has a higher value
  def <=>(other)
    value <=> other.value
  end

end
