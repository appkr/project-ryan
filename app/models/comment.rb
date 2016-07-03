class Comment < ActiveRecord::Base
  belongs_to :users, foreign_key: "user_id"
  belongs_to :comments, foreign_key: "parent_id"
  belongs_to :articles, foreign_key: "article_id"
end
