class AddUserIdToUserspec < ActiveRecord::Migration[5.0]
  def change
    add_column :userspecs, :user_id, :integer
  end
end
