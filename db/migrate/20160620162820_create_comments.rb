class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

      t.integer :user_id, null: false
      t.integer :parent_id
      t.string :content, null: false

      t.timestamps null: false
    end

    add_index :comments, :user_id
    add_index :comments, :parent_id
  end
end
