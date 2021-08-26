# README

# World's Simplest Poker

# Challenge

Build an application that:
1. Shuffles a standard 52 card deck
2. Deals a fixed number of cards to each player
3. Calculate the value of the cards and declare a winner  

# Criteria

## Instructions for running the code locally 

1. git clone the repo
2. Navigate into the correct repo
3. run bundle install in your terminal
4. run rails s in your terminal
   
## Testing Criteria
1. Test coverage over 85%
2. Frequent commits to Github
3. Classes and methods should have comment blocks explaining what they do. 
4. No leftover dependencies

## Heroku (click the link)
[World's Simplest Poker](https://poker-tech-test.herokuapp.com/)


## Planning

### Classes
  - Game
  - Player
  - Deck
  - Card
  - Hand

## Feature test steps 

1. Single player game winner
   - Game
   - Player

notes: A game is started and player is declared the winner
  
2. Two player game winner with random score
   - Game
   - Player
   - Hand
   - Hand.score (e.g 13)
   - Game.winning_hand

notes: a game is started, players are introduced, players get a hand with a random score, the higher number is declared the winner. 
  
1. Two player game winner with controlled single card score
   - Game
   - Player
   - Card
   - Hand.score --> Card
   - Game.winning_hand

notes: a game is started, 2 players are introduced, a card object is created, the hand pulls from the card object, caluculates the score and then player 1 is declared the winner. It's possible that the logic that was previously put in the Hand object will need to move
to the Card Object. For now that card objects main responsibility will be to have a single card. The hand will pull from that single card (array?). 
  
4. Two player game winner with controlled deck with a single card score
   - Game
   - Player
   - Deck
   - Deck.shuffle
   - Deck.deal
   - Card
   - Hand.score --> Card
   - Game.winning_hand

notes: a game is started, 2 players are introduced, a deck object is created with methods that match the user story (e.g shuffle), the deck deals to the card object, the hand takes from the card object, etc. The main concern here is existing logic will need to be refactored
in order to better suit the objects and classes. For now I'm thinking the Deck object is a 52 card array which shuffles and deals. The single card dealt will be recieved by the card object and then the hand will calculate the score of the card. At this point I want to declare the player with the highest hand to win the game. 
  
5. Two player game winner with controlled deck with five cards
   - Game
   - Player
   - Deck
   - Deck.shuffle
   - Deck.deal
   - Card
   - Hand.score --> Card
   - Game.winning_hand

notes: The same process as before with the only addition being that the deck will now deal 5 cards and the logic will need to change accordingly to accomadate a 5 card game. 

6. The user can select the amount of players with controlled deck with five cards
7. The user can select the amount of players with randomized deck with five cards
8. The user can select the amount of players and the amount of cards to be dealt
9. The player object/class prevents an impossible combination of players
10. The card object/class prevents an impossible combination of cards


## Resources used
1. https://guides.rubyonrails.org/
2. Agile web development with Rails 6
3. https://www.youtube.com/watch?v=C26lA9dGubo&t=446s&ab_channel=ChangeMachineLabs
4. https://www.youtube.com/watch?v=3Imzatrk0cg&ab_channel=SamMorgan
5. https://newbedev.com/heroku-problem-the-page-you-were-looking-for-doesn-t-exist


   
## Relevent commit messages from Rails project
1. Readme updated with the challenge, criteria and some basic planning.
2. Main planning stage finished. It's all in the README.md file. I've fleshed out my process under the classes and feature test steps headers.

