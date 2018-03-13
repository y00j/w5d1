require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before :each do
    visit new_user_path
  end
  scenario 'has a new user page' do
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do

      fill_in 'Username', with: 'Nimama'
      fill_in 'Password', with: 'Tamama'
      click_button 'Sign Up'
      # save_and_open_page
      expect(page).to have_content('Nimama')

    end

  end
end

feature 'logging in' do
  before(:all) do
    visit new_session_path
  end
  scenario 'shows username on the homepage after login' do

    User.create!(username: 'Nimama', password: 'Tamama')

    fill_in 'Username', with: 'Nimama'
    fill_in 'Password', with: 'Tamama'
    click_button 'Log In'
    expect(page).to have_content('Nimama')
  end
end

feature 'logging out' do
  before(:each) do
    visit new_session_path
  end
  scenario 'begins with a logged out state' do
    expect(page).to have_content('Log In')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    # visit new_session_path

    User.create!(username: 'Nimama', password: 'Tamama')

    fill_in 'Username', with: 'Nimama'
    fill_in 'Password', with: 'Tamama'
    click_button 'Log In'
    click_button 'Log Out'
    expect(page).not_to have_content('Nimama')

  end

end
