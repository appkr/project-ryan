class Article < ActiveRecord::Base
  validates :title, presence: { message: '제목을 입력해주시기 바랍니다.'}

  belongs_to :user, foreign_key: "user_id"
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :attachments
end
