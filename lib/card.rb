# a single card
 
class Card

  attr_reader :value, :suit

  include Comparable

  REAL_VALUE = {
    :ace => 1, 
    2 => 2, 
    3 => 3, 
    4 => 4, 
    5 => 5, 
    6 => 6, 
    7 => 7, 
    8 => 8, 
    9 => 9, 
    10 => 10, 
    :jack => 11, 
    :queen => 12, 
    :king => 13 
  }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def real_value
    REAL_VALUE[value]
  end

  def to_s
    "the #{value} of #{@suit}"
  end

  def <=>(other)
    value <=> other.value
  end

end