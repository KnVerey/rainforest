class User < ActiveRecord::Base
	has_secure_password
	has_many :reviews, dependent: :destroy
	has_many :products, :through => :reviews

	validates_presence_of :first_name, :last_name, :username, :email
	validates :email, uniqueness: true
end
