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

run irb in your terminal
game = Game.new
game.play

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
