class AddCategoryToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :category_id, :integer
    add_index :documents, :category_id
  end
end
