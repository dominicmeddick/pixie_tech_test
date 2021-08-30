require_relative 'hand'

# A player
class Player

  attr_accessor :name, :hand

  # Initializes a player with the given name and an empty hand
  def initialize(name)
    @name = name
    @hand = Hand.new
  end
end
