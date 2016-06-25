class Vote < ActiveRecord::Base
  belongs_to :users

  foreign_key: "user_id"
  foreign_key: "comment_id"
end
