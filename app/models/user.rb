class User < ActiveRecord::Base
	has_secure_password
	
	has_many :products, dependent: :destroy
	has_many :received_reviews, :through => :products, :class_name => "Review", :source => :user

	has_many :reviews, dependent: :destroy
	has_many :reviewed_products, :through => :reviews, :class_name => "Product", :source => :product

	validates_presence_of :first_name, :last_name, :username, :email
	validates :email, uniqueness: true
end
