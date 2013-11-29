class Message < ActiveRecord::Base
	belongs_to :listing
	belongs_to :user

	validates :comment, presence: true
end
