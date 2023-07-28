require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it 'validates presence of name' do
      product = Product.new(price: 100, description: 'Sample description')
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of price' do
      product = Product.new(name: 'Sample Product', description: 'Sample description')
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'validates presence of description' do
      product = Product.new(name: 'Sample Product', price: 100)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
    end

    it 'validates description length' do
      product = Product.new(name: 'Sample Product', price: 100, description: 'a' * 5001)
      product.valid?
      expect(product.errors[:description]).to include("is too long (maximum is 5000 characters)")
    end
  end
end

