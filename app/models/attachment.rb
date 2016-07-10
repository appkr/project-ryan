class Attachment < ActiveRecord::Base
  belongs_to :articles

  attr_accessor :article_id, :filename, :bytes, :mime
  
  validates :article_id, presence: true,
    numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

  validates :filename, presence: true,
    format: { without: /\s/ }

  validates :bytes, presence: true,
    numericality: { only_integer: true, :greater_than_or_equal_to => 0 }

end
