class Follow < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :followee, class_name: "User"

  validates :user_id, presence: true
  validates :followee_id, presence: true
end
