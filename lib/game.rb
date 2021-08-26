class Game

  def initialize
    @players = Player.new
  end

  def add_player(player)
    @players.playername << player
  end

  # gives a player a hand/card. Will push out into seperate class as program grows
  def draw_card
    @players.hand << rand(1..13)
  end

  # this method will contain the logic for declaring a winner
  def declare_winner
    @players[0].hand > @player[1].hand ? "Dom wins" : "David wins"
  end
end
