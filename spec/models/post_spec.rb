require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'before publication' do
    it 'cannot have comments' do
      expect { Post.create!(content: "") }.to raise_error(ActiveRecord::RecordInvalid)  # test code
    end
  end
end
