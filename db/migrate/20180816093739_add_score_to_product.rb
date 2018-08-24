class AddScoreToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :score, :float
  end
end
