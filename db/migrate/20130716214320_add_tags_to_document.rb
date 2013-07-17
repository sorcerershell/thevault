class AddTagsToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :tags, :string
  end
end
