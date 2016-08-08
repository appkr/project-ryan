class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.integer :notification, default: 0
      t.integer :view_count, default: 0

      t.timestamps null: false
    end

    add_index :articles, :user_id
    add_index :articles, :title
    add_index :articles, :content
    add_foreign_key :articles, :users, column: :user_id, primary_key: "id"
  end
end
