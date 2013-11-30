# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Category.delete_all
Listing.delete_all
Message.delete_all

categories = %w(Electronics Pets Clothing Transportation Miscellaneous Furniture Sports Decoration Books Jewellery Instruments Tools Kids Appliances)
categories.sort!
categories.each do |cat|
	Category.create(name: cat)
end

User.create(:email => 'demo1@rainforest.herokuapp.com', :password => '12password09', :password_confirmation => '12password09', :first_name => 'Sarah', :last_name => 'Smith')
User.create(:email => 'demo2@rainforest.herokuapp.com', :password => '12password09', :password_confirmation => '12password09', :first_name => 'John', :last_name => 'Miller')

Listing.create(:name => 'Kitten', :description => "She's adorable! I wish I didn't have to give her away!", :price_in_cents => 0, :photo => 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbqU_M962J8hGN0dji1Z-7kPxY_wH2p9ZxZdtTRl0I3H9g-bpR8w', :user_id => 1, :category_id => 11)
Listing.create(:name => 'Puppy', :description => "Very well behaved! Playful and loves to snuggle.", :price_in_cents => 10000, :photo => 'http://images4.fanpop.com/image/photos/14700000/So-cute-puppies-14749028-1600-1200.jpg', :user_id => 2, :category_id => 11)
Listing.create(:name => 'Socks', :description => "Brand new, still in package.", :price_in_cents => 800, :photo => 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSZCiKGXebYlWrAXrahhaW1jW2lvO-Ixb2F9QtushL1z4DHi6lc', :user_id => 1, :category_id => 3)
Listing.create(:name => 'Christmas Tree', :description => "Must pick up yourself. Located 2 hours outside Toronto.", :price_in_cents => 5000, :photo => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcToxP7LGzkimv0mmg7hQiCZfQgPCwR2tLnsFlfM1Ws2aXxj6lAq', :user_id => 2, :category_id => 4)


Message.create(:comment => "I'm interested. How old is she? Is she vaccinated?", :listing_id => 1, :user_id => 2)
Message.create(:comment => "Would you be willing to take $80?", :listing_id => 2, :user_id => 1)