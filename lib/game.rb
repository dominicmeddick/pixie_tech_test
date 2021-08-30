require_relative 'player'
require_relative 'deck'

# 
class Game

  attr_accessor :players

  # Initializes a game with no players
  def initialize
    @players = []
  end

  # Adds a player with the given name to the game
  def add_player(name)
    if name.nil? || name.strip.empty? then
      puts "Please enter a valid name"
      return false
    elsif @players.length < 52
      # There are only 52 cards in the deck, so there
      # cannot be more than 52 players
      @players << Player.new(name)
      return true
    else
      puts "You can't add anymore players"
      return false
    end
  end
  
  # Sets the number of cards each player gets dealt
  def set_num_cards_per_player(number)
    @deck = Deck.new
    if number == 0
      return false
    elsif @deck.length / @players.length >= number
      @amount_of_cards = number
      return true
    else
      puts "Not enough cards in the deck!"
      return false
    end
  end

  # Deals cards into each player's hand
  def deal_cards
    @deck.shuffle

    for player in @players do
      @amount_of_cards.times { player.hand.take_card(@deck.draw) }
    end
  end

  # Decides the winner of the game based on the score of each player's
  # hand and returns a string declaring the winner (or winners, in the case of a draw)
  def decide_winner
    descending_sort = ->(a,b) { b.hand.total_score  <=> a.hand.total_score }
    @players.sort!( & descending_sort )

    first_score = @players[0].hand.total_score
    ties = []
    for player in @players do
      if player.hand.total_score == first_score
        ties << player
      end
    end
    
    winners = @players[0].name
    for i in (1...ties.length)
      winners += " and " + ties[i].name
    end
    return "#{winners} wins!"
  end

  # Takes input to add players to a game.
  # Used if game is run in console.
  def get_players_input
    loop do
      puts "Add a new player: "
      name = gets.chomp
      add_player(name)
      puts "Would you like to add a new player? y/n"
      answer = gets.chomp.downcase
      if answer.eql?("n")
        break
      end   
    end
  end

  # Takes input to set the number of cards dealt.
  # Used if game is run in console.
  def get_card_number_input
    loop do 
      puts "Enter amount of cards per player"
      card_amount = gets.chomp.to_i
      is_valid = set_num_cards_per_player(card_amount)

      if is_valid
        break
      end
    end
  end

  def sort_players_cards
    for player in @players
      player.hand.sort_cards
    end
  end


  # Runs the game
  def play
    get_players_input
    get_card_number_input
    deal_cards
    sort_players_cards
    decide_winner
  end
end
