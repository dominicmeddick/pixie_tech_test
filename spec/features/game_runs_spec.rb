require 'spec_helper'
 
feature 'Game runs correctly' do
  scenario 'The user adds a correct amount of players and cards' do
    visit "/"
    fill_in "player_name", with: "Dom"
    click_button "Submit"
    fill_in "player_name", with: "David"
    click_button "Submit"
    fill_in "card_number", with: "10"
    click_button "Play The Game"
    expect(page).to have_content "wins"
  end
end
