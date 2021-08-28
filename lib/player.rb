require_relative 'hand'

class Player

  attr_accessor :name, :hand

  def initialize(name)
    @name = name
    @hand = Hand.new
  end
end
