class Game

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  #gives a player a hand/card. Will push out into seperate class as program grows
  def hand
    "10"
  end

  #this method will contain the logic for declaring a winner
  def declare_winner
    "Player wins"
  end

end
