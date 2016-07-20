class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :votes
  
  # About Follow Relation
  has_many :active_follows, class_name: "Follow", foreign_key: "user_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy

  has_many :following, through: :active_follows, source: :followee
  has_many :followers, through: :passive_follows, source: :user

  # Validates
  validates :password, confirmation: true
  validates :name, :email, presence: true
  validates :email, :format => /@/
  validates :name, length: 4..40
  validates :password, length: 4..40

  # Follows a user.
  def follow(other_user)
    active_follows.create(followee_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_follows.find_by(followee_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end