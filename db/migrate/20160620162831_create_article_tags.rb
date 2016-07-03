class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|

      t.integer :article_id, null: false
      t.integer :tag_id, null: false

      t.timestamps null: false
    end

    add_index :article_tags, :article_id
    add_index :article_tags, :tag_id
  end
end
