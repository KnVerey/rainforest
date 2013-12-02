class Listing < ActiveRecord::Base
	validates :description, :name, :price_in_cents, :category_id, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	belongs_to :user
	has_many :messagers, :through => :messages, :class_name => "User", :source => :user
	has_many :messages, dependent: :destroy

	belongs_to :category

	def formatted_price
		return "FREE" if price_in_cents==0
		"$" + price_in_dollars
	end

	def price_in_dollars
		sprintf("%.2f",(price_in_cents.to_f / 100))
	end

end
