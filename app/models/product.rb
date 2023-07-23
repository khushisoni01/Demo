class Product < ApplicationRecord
	has_one_attached :picture
	belongs_to :account
	has_many :orders
end
