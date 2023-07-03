# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テストデータの作成
num_users = 3
num_articles_by_user = 50
num_tags = 5
tag = [
  "学習",
  "転職活動",
  "豆知識",
  "休憩",
  "その他"
]
num_tags.times do |i|
  Tag.find_or_create_by!(name: "#{tag[i]}")
end

num_users.times do |i|
  User.find_or_create_by(
    email: sprintf("user%03d@test.com", i+1),
    password: "test1234"
  )
  tmp_user = User.all
  tmp_user = tmp_user[i]

  num_articles_by_user.times do |j|

    tmp_user.articles.find_or_create_by(
      title: sprintf("No.%d:user%03dの記事", j+1, i+1),
      content: sprintf("No.%d:user%03dの記事の本文", j+1, i+1)
    )
    tag_index = j % tag.count + 1     # id指定するので0〜4ではなく1〜5が必要
    tmp_user.articles[j].tag_article.find_or_create_by(
      article_id: j+i*num_articles_by_user-1,
      tag_id: tag_index
    )
  end
end
