class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :attachment
      t.integer :folder_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
