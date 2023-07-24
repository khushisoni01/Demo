class Room < ApplicationRecord
	has_many :messages
	has_many :participants, dependent: :destroy
	validates_uniqueness_of :name
  	scope :public_rooms, -> { where(is_private: false) }
  	# after_create_commit {broadcast_append_to "rooms"}
  	after_create_commit { broadcast_if_public }

  	def broadcast_if_public
  		broadcast_append_to "rooms" unless self.is_private
	end

	def self.create_private_room(accounts, room_name)
  		single_room = Room.create(name: room_name, is_private: true)
  		accounts.each do |account|
    		Participant.create(account_id: account.id, room_id: single_room.id )
  		end
  		single_room
	end
end
