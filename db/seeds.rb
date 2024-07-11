# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
end

sakurako = User.find_or_create_by!(email: "sakurako@example.com") do |user|
  user.name = "桜子"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

katsuki = User.find_or_create_by!(email: "katsuki@example.com") do |user|
  user.name = "かっちゃん"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

yuzuru = User.find_or_create_by!(email: "yuzuru@example.com") do |user|
  user.name = "ユズル"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Post.find_or_create_by!(title: "ぬいとカフェへ") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")
  post.body = "パフェが来るまで一緒に待ってます！"
  post.user = sakurako
end

Post.find_or_create_by!(title: "共に山登り") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")
  post.body = "自然の中で癒される。"
  post.user = katsuki
end

Post.find_or_create_by!(title: "片付け見守り隊長") do |post|
  post.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")
  post.body = '見守ってもらったら早く終わった気がする。'
  post.user = yuzuru
end