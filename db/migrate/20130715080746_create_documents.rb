class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.references :group
      t.references :user
      t.integer :year

      t.timestamps
    end
    add_index :documents, :group_id
    add_index :documents, :user_id
  end
end
