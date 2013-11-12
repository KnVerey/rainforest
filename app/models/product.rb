class Product < ActiveRecord::Base
	validates :description, :name, :price_in_cents, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	has_many :reviews, dependent: :destroy
	has_many :users, :through => :reviews

	def formatted_price
		sprintf("%.2f",price_in_dollars)
	end

	def price_in_dollars
		price_in_cents.to_f / 100
	end

	def no_reviews?(current_user)
		(current_user.nil? && self.reviews.empty?) || (!current_user.nil? && self.reviews[0].user_id.nil?)
	end
end
