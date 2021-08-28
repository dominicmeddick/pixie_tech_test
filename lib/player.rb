class Player

  attr_accessor :hand

  def initialize
    @name = []
    @hand = Hand.new
  end

end
