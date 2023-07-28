require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it 'validates presence of address' do
      order = Order.new
      order.valid?
      expect(order.errors[:address]).to include("can't be blank")
    end

    it 'validates address length minimum' do
      order = Order.new(address: 'a' * 4)
      order.valid?
      expect(order.errors[:address]).to include("is too short (minimum is 5 characters)")
    end

    it 'validates address length maximum' do
      order = Order.new(address: 'a' * 61)
      order.valid?
      expect(order.errors[:address]).to include("is too long (maximum is 60 characters)")
    end
  end
end

