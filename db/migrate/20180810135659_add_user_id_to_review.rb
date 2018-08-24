class AddUserIdToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :user_id, :integer
    add_index :reviews, :user_id
  end
end
