require 'spec_helper'

feature 'Visitor signs in' do
  scenario 'successfully' do
    User.create!(email: 'bob@example.com', password: 'password')

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'

    expect(page).to have_content 'Signed in as bob@example.com'
    expect(page).to have_link 'Sign out'
  end
end
