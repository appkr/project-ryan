class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :comments
  has_many :votes
  
  # Follow
  has_many :active_follows, class_name: "Follow", foreign_key: "user_id", dependent: :destroy
  has_many :passive_follows, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy

  has_many :following, through: :active_follows, source: :followee
  has_many :followers, through: :passive_follows, source: :user

  validates :password, confirmation: true
  # validates :password_confirmation, presence: true
  validates :name, :email, presence: true
  validates :email, :format => /@/
  validates :name, length: 4..40
  validates :password, length: 4..40
end