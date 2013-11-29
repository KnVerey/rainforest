class RenameReviewsTable < ActiveRecord::Migration
  def change
  	rename_table :reviews, :messages
  end
end
