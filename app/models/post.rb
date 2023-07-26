class Post < ApplicationRecord
	acts_as_votable
	# has_one_attached :image
	has_many_attached :pictures, dependent: :destroy
	belongs_to :account
	validates :description, length: {maximum: 5000}, presence: true
end

