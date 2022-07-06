require 'rails_helper'
require 'capybara/rails'
module AuthHelper

  def login_user
    user = FactoryBot.create(:user)
    @email = user.email
    @password = user.password
    visit 'users/sign_in'
    within('form') do
      fill_in 'Email', with: @email
      fill_in 'Password', with: @password
      click_button 'Log in'
    end
    expect(page).to have_no_css("form#user_email")
  end

  def register_user
    @email =  Faker::Internet.email
    @password = "somepassword"
    visit 'users/sign_up'
    within('form') do
      fill_in 'Email', with: @email
      fill_in 'Password', with: @password
      fill_in 'Password confirmation', with: @password
      click_button 'Sign up'
    end
    expect(page).to have_no_css("form#user_email")
  end
end
