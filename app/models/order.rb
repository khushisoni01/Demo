class Order < ApplicationRecord
	belongs_to :account
	belongs_to :product
	validates :address, length: {in: 5..60}, presence: true


	 def self.ransackable_attributes(auth_object = nil)
       ["account_id", "address", "confirm", "created_at", "id", "price", "product_id", "updated_at"]
     end

end
   