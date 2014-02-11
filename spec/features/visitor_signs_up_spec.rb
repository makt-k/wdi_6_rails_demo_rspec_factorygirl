require 'spec_helper'

feature 'Visitor signs up' do
  background do
    visit root_path
    click_link 'Sign Up'
  end

  scenario 'successfully' do
    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome!'
    expect(page).to have_content 'Signed in as bob@example.com'
    expect(page).to have_link 'Sign out'
  end

  scenario 'unsuccessfully with blank fields' do
    click_button 'Sign up'
    expect(page).to_not have_content('Signed in')
    expect(page).to have_content("can't be blank")
  end
end
