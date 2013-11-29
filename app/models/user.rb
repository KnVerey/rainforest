class User < ActiveRecord::Base
	has_secure_password
	
	has_many :listings, dependent: :destroy
	has_many :received_messages, :through => :listings, :class_name => "Message", :source => :user

	has_many :messages, dependent: :destroy
	has_many :messageed_listings, :through => :messages, :class_name => "Listing", :source => :listing

	validates_presence_of :first_name, :last_name, :email
	validates :email, uniqueness: true
end
