class Follow < ActiveRecord::Base
  belongs_to :users, foreign_key: "user_id"
  belongs_to :users, foreign_key: "followee_id"
end
