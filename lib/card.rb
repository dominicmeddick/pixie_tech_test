# a single card
 
class Card

  attr_reader :value, :suit

  include Comparable

  REAL_VALUE = {
    1 => :ace, 
    2 => 2, 
    3 => 3, 
    4 => 4, 
    5 => 5, 
    6 => 6, 
    7 => 7, 
    8 => 8, 
    9 => 9, 
    10 => 10, 
    11 => :jack, 
    12 => :queen, 
    13 => :king 
  }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def real_value
    REAL_VALUE[value]
  end

  def to_s
    "the {real_value} of #{@suit}"
  end

  def <=>(other)
    value <=> other.value
  end

end