require 'game'
require 'player'

describe Game do 

  # it 'declares a winner' do
  #   game = Game.new
  #   player = Player.new
  #   player2 = Player.new
  #   game.add_player(player)
  #   game.add_player(player2)
  #   game.draw_card
  #   allow(game).to receive(:declare_winner).and_return("Player 1 wins")
  #   expect(game.declare_winner).to eq "Player 1 wins"
  # end

  # it 'the a player can pick a card' do
  #   allow(subject).to receive(:draw_card).and_return(10)
  #   expect(subject.draw_card).to eq 10
  # end

  # it 'allows user to add players to the game' do
  #   player = Player.new
  #   expect(subject.add_player(player)).to eq [player]
  # end

  # # not happy with this test. Should expect to see the hand array from the player object to include 10. 
  # it 'allows the player to draw a card into their hand' do
  #   player = Player.new
  #   game = Game.new
  #   allow(game).to receive(:draw_card).and_return(10)
  #   expect(game.draw_card).to equal(10)
  # end
end
