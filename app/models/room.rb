class Room < ApplicationRecord
	has_many :messages
	validates_uniqueness_of :name
  	scope :public_rooms, -> { where(is_private: false) }
  	has_many :participants, dependent: :destroy
  	after_create_commit { broadcast_if_public }

  	# after_create_commit {broadcast_append_to "rooms"}
  	def broadcast_if_public
    	broadcast_append_to 'rooms' unless is_private
	end

	def self.create_private_room(accounts, room_name)
    	single_room = Room.create(name: room_name, is_private: true)
    	accounts.each do |account|
        Participant.create(account_id: account.id, room_id: single_room.id)
    end
    single_room
end
end
