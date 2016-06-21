class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|

      t.integer :article_id
      t.string :filename, null: false
      t.integer :bytes
      t.string :mime

      t.timestamps null: false
    end

    add_index :attachments, :article_id 
  end
end
