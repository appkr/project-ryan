# Data Seed


# Create Tags
tags = []
Random.rand(1..10).times do |i|
 tags << Tag.create(name: "moka", slug: "coffee ##{i}")
end

# Create Users
users = []
articles = []
comments = []

10.times do |i|
  user = User.create(name: "moka Lee ##{i}", email: "test#{i}@aa.com", password: 1234)

  # Create Articles
  Random.rand(1..10).times do |j|
    article = Article.create(user_id: user.id, title: "Article ##{j}", content: "content", notification: 0, view_count: Random.rand(1...100))
    articles << article

    # Relation Tag & Articles
    Random.rand(1..4).times do |k|
      tag_id = tags[Random.rand(0...tags.length)].id
      
      unless ArticleTag.exists?(tag_id: tag_id)
        ArticleTag.create(article_id: article.id, tag_id: tag_id)
      end
    end

    # Create Comments
    10.times do |i|
      if i > 1 and Random.rand(1..3) == 1
        comments << Comment.create(user_id: user.id, article_id: article.id, parent_id: Random.rand(1...i), content: "Comment Foo Bar ##{i}")
      else
        comments << Comment.create(user_id: user.id, article_id: article.id, content: "Comment Foo Bar ##{i}")
      end
    end
  end

  users << user
end

# Create Attachments
20.times do |i|
  article_id = articles[Random.rand(0...articles.length)].id
  Attachment.create(article_id: article_id, filename: "attachment ##{i}", mime: "image/image")
end

# Create Votes
Random.rand(10..20).times do |i|
  comment_id = comments[Random.rand(0...comments.length)].id
  user_id = users[Random.rand(0...users.length)].id
  Vote.create(comment_id: comment_id, user_id: user_id, voted_at: Time.now)
end

# Relation Follow User
Random.rand(10..30).times do |i|
  user_id = users[Random.rand(0...users.length)].id
  followee_id = users[Random.rand(0...users.length)].id

  unless Follow.where(user_id: user_id, followee_id: followee_id).first
    Follow.create(followee_id: followee_id, user_id: user_id)  	
  end
end

