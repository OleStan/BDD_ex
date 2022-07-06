module UserAuthenticateStepHelper
  def login
    user = FactoryBot.create(:user)
    visit 'users/sign_in'
    within('form') do
      fill_in 'Email', with: @email
      fill_in 'Password', with: @password
      click_button 'Log in'
    end
  end

  def signup
    within('form') do
      fill_in 'Email', with: @email
      fill_in 'Password', with: @password
      fill_in 'Password confirmation', with: @password
      click_button 'Sign up'
    end
  end
end
World UserAuthenticateStepHelper


Given(/^I navigate to the login page$/) do
  visit '/users/sign_in'
end

When(/^I submit username and password$/) do
  @email = 'test@email.com'
  @password = 'password'
  login
end

Then(/^I should be logged in$/) do
  expect(page).to have_no_css('input#user_email')
end

Given(/^I navigate to the signup page$/) do
  visit 'users/sign_up'
end

When(/^I submit username and password and password confirmation$/) do
  @email = 'test@email.com'
  @password = 'password'
  signup
end
