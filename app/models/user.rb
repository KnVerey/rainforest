class User < ActiveRecord::Base
	has_secure_password
	
	has_many :products, dependent: :destroy
	has_many :received_messages, :through => :products, :class_name => "Message", :source => :user

	has_many :messages, dependent: :destroy
	has_many :messageed_products, :through => :messages, :class_name => "Product", :source => :product

	validates_presence_of :first_name, :last_name, :email
	validates :email, uniqueness: true
end
