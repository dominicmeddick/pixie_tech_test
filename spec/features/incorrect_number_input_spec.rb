# frozen_string_literal: true

require 'spec_helper'

feature 'Incorrect user input' do
  scenario 'The user forgets to enter a number' do
    visit '/'
    fill_in 'player_name', with: 'Dom'
    click_button 'Submit'
    fill_in 'card_number', with: ''
    click_button 'Play The Game'
    expect(page).to have_content 'You need to enter a number greater than 0'
  end
end
