require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @invalid_post = Post.new(description: '', account_id: 1)
    @valid_post = Post.new(description: 'Khushi', account_id: 1)
    @invalid_description = Post.create(description: '')
  end

  describe 'validations' do
    it 'validates presence of description' do
      post = @invalid_post
      post.valid?
      expect(post.errors[:description]).to include("can't be blank")
    end

    # it 'validates presence of account_id' do
    #   post = @invalid_post
    #   post.valid?
    #   expect(post.errors[:account_id]).to include("can't be blank")
    # end

    it 'validates description length' do
      post = Post.new(description: 'a' * 5001, account_id: 1)
      post.valid?
      expect(post.errors[:description]).to include("is too long (maximum is 5000 characters)")
    end
  end
end
