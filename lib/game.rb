require_relative 'player'

class Game

  attr_accessor :players

  def initialize
    @players = []
  end

  def add_player(name)
    if @players.length < 52
      @players << Player.new(name)
    else
      puts "You can't add anymore players"
  end
  
  def set_number_of_cards(number)
    @deck = Deck.new
    if @deck.length / @players.length >= 1
      @amount_of_cards = number
    else
      puts "Not enough cards in the deck!"
  end

  def play
    @deck.shuffle

    for player in @players do
      @amount_of_cards.times { player.hand.take_card(deck.draw) }
    end

    descending_sort = ->(a,b) { b.hand.total_score  <=> a.hand.total_score }
    @players.sort( & descending_sort )

    puts "#{@players[0].name} wins!"
  end
end
