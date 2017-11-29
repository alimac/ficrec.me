# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_count = 35
fandom_count = 10
collection_count = 50
fanwork_count = 30

# Users
user_count.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  admin = (n == 0)
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin,
               activated: true,
               activated_at: Time.zone.now)
end

# Fandoms
fandom_count.times do |n|
  name  = Faker::Book.title
  category = Faker::Book.genre
  Fandom.create!(name:  name,
                 category: category)
end

# Collections
users = User.order(:created_at).take(5)
collection_count.times do |n|
  users.each { |user| user.collections.create!(title: Faker::Book.title,
                                               fandom: Fandom.all.sample) }
end

# Fanworks
fanwork_count.times do |n|
  title  = Faker::Book.title
  fandom = Fandom.all.sample
  link = Faker::Internet.url
  comment = Faker::Hipster.sentence
  review = Faker::Hipster.paragraph
  collections = Collection.all.sample(3)
  Fanwork.create!(title: title,
                     fandom: fandom,
                     collections: collections,
                     link: link,
                     comment: comment,
                     review: review)
end
