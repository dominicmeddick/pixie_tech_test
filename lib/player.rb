class Player

  attr_accessor :name

  def initialize
    @name = []
    @hand = Hand.new
  end

  def enter_name(name)
    @name << name
  end

end
