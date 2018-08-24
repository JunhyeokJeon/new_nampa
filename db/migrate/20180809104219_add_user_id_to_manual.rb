class AddUserIdToManual < ActiveRecord::Migration[5.0]
  def change
    add_column :manuals, :user_id, :integer
    add_index :manuals, :user_id
  end
end
