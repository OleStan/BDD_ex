require 'rails_helper'
require 'capybara/rails'


RSpec.describe Post, type: :model do
  describe 'The post creation', type: :feature do
    before :each do
      create :post, :visible
    end
    context 'before publication' do
      it 'cannot have comments' do
        expect { Post.create!(content: '') }.to raise_error(ActiveRecord::RecordInvalid)  # test code
      end
      it 'already present post' do
        visit '/posts'
        expect(page).to have_css("#post_#{Post.first.id}")
      end
    end
    context 'create new publication' do
      it 'new post visible' do
        title = 'test.title'
        content = 'Content.test'
        visit '/posts/new'
        within('form') do
          fill_in 'Title', with: title
          fill_in 'Content', with: content
          find(:css, '#post_visibility').set(true)
          click_button 'Create Post'
        end
        post = Post.find_by(title: title)

        visit '/posts'
        expect(page).to have_css("#post_#{post.id}")
      end
      it 'new post hidden' do
        title = 'test.title.hidden'
        content = 'Content.test.hidden'
        visit '/posts/new'
        within('form') do
          fill_in 'Title', with: title
          fill_in 'Content', with: content
          find(:css, '#post_visibility').set(false)
          click_button 'Create Post'
        end
        post = Post.find_by(title: title)

        visit '/posts'
        expect(page).to have_no_css("#post_#{post.id}")
      end
    end
  end
end
