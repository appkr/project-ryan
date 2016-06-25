class Comment < ActiveRecord::Base
  belongs_to :users

  foreign_key: "user_id"
  foreign_key: "article_id"
  foreign_key: "parent_id"
end
