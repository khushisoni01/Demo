class Order < ApplicationRecord
	belongs_to :account
	belongs_to :product
	validates :address, length: {in: 5..60}, presence: true
end
