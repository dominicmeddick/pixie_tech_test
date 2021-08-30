# README

# World's Simplest Poker

# Challenge

A very simple card game, played between two or more players where immediately after the cards are dealt, the player with the highest hand wins.

## Clone this repo

To install dependencies:

```shell
bundle
```

Run test suites with:

```shell
rspec
```

Start the server to run locally:

```
ruby app.rb
```

To play the game in irb:

1. run irb in your terminal
2. require './lib/game.rb'
3. game = Game.new
4. game.play

![Alt text](/images/irb.png)

Navigate to http://localhost:4567/ in your browser

## Testing

1. Test coverage is 100% and is measured with simplecov
2. Testing includes both feature and unit tests

## Heroku (click the link)
[World's Simplest Poker](https://pixie-tech-test.herokuapp.com/)

The website works accross multiple browers and devices 

# If I had more time I would have

## Creating an account to keep track of games you've played and high scores
1. I would incorporate a database into my application e.g postgres. 
2. Create a sign up/sign in page
3. When a user wins a game the results gets pushed to the database
4. Users can check the games they've played and high scores from their profile page on the website. 

## Tie-breaker: use card suit to determine an overall winner

1. Assign each suit a value
2. Get the score and rank players normally
3. If there is a tie call the tiebreaker score method
4. In the tiebreaker method count the value of the suits in the players hands.
5. Rank players
6. Declare winner

## Front end

1. I would add more stylistic flair!
2. Unfortunately I didn't have time to do any CSS.
3. I would have liked to display some of the backend features I wrote into the frontend of the game. 

### Technologies Used

I used the following technologies:

- [Sinatra](http://sinatrarb.com/)
  - Used as the main framework for the application.
- [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)
  - Used as the main language for the templates
- [CSS3](https://developer.mozilla.org/en-US/docs/Archive/CSS3)
  - Used for the overall look of the site and player animations.
- [Git](https://git-scm.com/)
  - Used for version control.
- [Heroku](https://www.heroku.com/)
  - Used to host the web app.
- [RSpec](https://rspec.inof/)
  - Used for automated testing.
- [Capybara](https://github.com/teamcapybara/capybara/)
  - Used for functional tests that simulate how users would interact with the application.
