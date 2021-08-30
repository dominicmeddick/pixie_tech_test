require 'spec_helper'
 
feature 'player has to enter a name' do
  scenario 'The user forgets to enter a name' do
    visit "/"
    fill_in "player_name", with: ""
    fill_in "card_number", with: "5"
    click_button "Play The Game"
    expect(page).to have_content 'You need to enter a player'
  end
end