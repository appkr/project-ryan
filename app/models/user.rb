class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  has_many :votes
  has_many :follows
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :name, :email, presence: true
  validates :email, :format => /@/
  validates :name, length: 4..40
  validates :password, length: 4..40
end
