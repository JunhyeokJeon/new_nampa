class AddUserIdToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end
end
