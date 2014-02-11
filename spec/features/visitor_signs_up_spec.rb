require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'successfully' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome!'
    expect(page).to have_content 'Signed in as bob@example.com'
    expect(page).to have_link 'Sign out'
  end
end
