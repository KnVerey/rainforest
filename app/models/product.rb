class Product < ActiveRecord::Base
	validates :description, :name, :price_in_cents, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	belongs_to :user
	has_many :reviewers, :through => :reviews, :class_name => "User", :source => :user
	has_many :reviews, dependent: :destroy

	def formatted_price
		return "FREE" if price_in_cents==0
		"$" + price_in_dollars
	end

	def price_in_dollars
		sprintf("%.2f",(price_in_cents.to_f / 100))
	end

end
