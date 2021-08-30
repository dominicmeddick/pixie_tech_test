require_relative 'player'

class Game

  attr_accessor :players

  def initialize
    @players = []
  end

  # adds players to a game
  def add_player(name)
    if name.nil? || name.strip.empty? then
      puts "Please enter a valid name"
      return false
    elsif @players.length < 52
      @players << Player.new(name)
      return true
    else
      puts "You can't add anymore players"
      return false
    end
  end
  
  # number of cards in a game
  def set_number_of_cards(number)
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

  # deals cards into a players hand
  def deal_cards
    @deck.shuffle

    for player in @players do
      @amount_of_cards.times { player.hand.take_card(@deck.draw) }
    end
  end    

  # decides the winner of the game
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

  # gets the players names and therefore amount of players in the game from the user
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

  # gets the amount of cards in a game from the user
  def get_card_number_input
    loop do 
      puts "Enter amount of cards per player"
      card_amount = gets.chomp.to_i
      is_valid = set_number_of_cards(card_amount)

      if is_valid
        break
      end
    end
  end

  #runs the game
  def play
    get_players_input
    get_card_number_input
    deal_cards
    decide_winner
  end
end
