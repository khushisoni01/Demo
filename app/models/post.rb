class Post < ApplicationRecord
	acts_as_votable
	# has_one_attached :image
	has_many_attached :pictures
	belongs_to :account
end

