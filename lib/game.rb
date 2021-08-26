class Game

  def initialize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  # gives a player a hand/card. Will push out into seperate class as program grows
  def draw_card
    @players.each { |player| player.hand << rand(1..13) }
  end

  # this method will contain the logic for declaring a winner
  def declare_winner
    @players[0].hand[0] > @players[1].hand[0] ? "Player 1 wins" : "Player 2 wins"
  end
end
