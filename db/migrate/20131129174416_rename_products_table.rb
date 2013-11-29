class RenameProductsTable < ActiveRecord::Migration
  def change
  	rename_table :products, :listings
  	rename_column :messages, :product_id, :listing_id
  end
end
