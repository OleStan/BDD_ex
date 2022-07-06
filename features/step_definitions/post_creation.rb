module PostCreationStepHelper
  def create_post(visibile = false)
    visit '/posts/new'
    within('form') do
      fill_in 'Title', with: @title
      fill_in 'Content', with: @content
      find(:css, '#post_visibility').set(visibile)
      click_button 'Create Post'
    end
  end

  def find_post_on_page(post_id)
    visit '/posts'
    expect(page).to have_css("#post_#{post_id}")
  end

  def no_post_on_page(post_id)
    visit '/posts'
    expect(page).to have_no_css("#post_#{post_id}")
  end

  def find_post_by_title(title)
    Post.find_by(title: title)
  end
end
World PostCreationStepHelper

Given(/^publication title "([^"]*)"$/) do |title|
  @title = title
end

And(/^publication content "([^"]*)"$/) do |content|
  @content = content
end

When(/^entered all params and check visible checkbox$/) do
  create_post(true)
end

When(/^entered all params and don't check visible checkbox$/) do
  create_post(false)
end

Then(/^Any user can see the post$/) do
  @post = find_post_by_title(@title)
  @post.visibility && find_post_on_page(@post.id)
end

Then(/^Nobody can see the post$/) do
  @post = find_post_by_title(@title)
  !@post.visibility && no_post_on_page(@post.id)
end