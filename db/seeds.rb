# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Category.destroy_all
Post.destroy_all
PostCategory.destroy_all
Comment.destroy_all

10.times do
  name = Faker::Name.name
  User.create(username: name, email: Faker::Internet.email(name: name, separators: '.'))
end

30.times do
  Category.create(name: Faker::Hipster.words[0])
end

10.times do
  content = []
  10.times do
    content << Faker::Hipster.sentences
  end
  Post.create(title: Faker::Hipster.sentences.first, content: content.uniq.join(" "))
end

p = Post.all 

p.each{ |post|
  r = rand(4...7)
  r.times do
    PostCategory.find_or_create_by(post: post, category: Category.all.sample )
  end
}

100.times do
  Comment.create(content: Faker::Hipster.sentences, user: User.all.sample, post: Post.all.sample)
end






