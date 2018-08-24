class AddCategoryToManual < ActiveRecord::Migration[5.0]
  def change
    add_column :manuals, :category, :string
  end
end
