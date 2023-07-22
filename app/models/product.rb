class Product < ApplicationRecord
	has_one_attached :picture
	belongs_to :account
end
