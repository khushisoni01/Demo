class Product < ApplicationRecord
  has_one_attached :picture, dependent: :destroy
  belongs_to :account
  has_many :orders, dependent: :destroy
  validates :name, :price, presence: true
  validates :description, length: {maximum: 5000}, presence: true
end