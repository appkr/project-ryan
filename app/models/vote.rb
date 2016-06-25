class Vote < ActiveRecord::Base
  belongs_to :users, foreign_key: "user_id"
  belongs_to :comments, foreign_key: "comment_id"
end
