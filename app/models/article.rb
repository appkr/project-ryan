class Article < ActiveRecord::Base
  belongs_to :users

  has_many :article_tags
  has_many :tags, through: :article_tags

  has_many :attachments

  foreign_key: "user_id"
end
