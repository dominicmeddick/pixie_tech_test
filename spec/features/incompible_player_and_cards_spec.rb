# frozen_string_literal: true

require 'spec_helper'

feature 'Incorrect user input' do
  scenario 'The user adds an incompatible amount of players and cards' do
    visit '/'
    fill_in 'player_name', with: 'Dom'
    click_button 'Submit'
    fill_in 'card_number', with: '54'
    click_button 'Play The Game'
    expect(page).to have_content "You've entered an impossible combination of cards and players"
  end
end
