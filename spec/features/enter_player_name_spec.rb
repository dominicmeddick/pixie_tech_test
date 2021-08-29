require 'spec_helper'
 
feature 'Enter names' do
  scenario 'Players can enter their names' do
    get_players_input
    expect(page).to have_content 'Player_1 vs. Player_2'
  end
end