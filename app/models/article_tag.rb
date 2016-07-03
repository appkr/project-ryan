class ArticleTag < ActiveRecord::Base
  belongs_to :articles
  belongs_to :tags
end
