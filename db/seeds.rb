# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fandoms = Fandom.create([
  { name: 'Death Note', category: 'Anime/Manga' },
  { name: 'Fullmetal Alchemist', category: 'Anime/Manga' }
])

collections = Collection.create([
  { title: 'Top Ten Death Note Fanfics', fandom_id: fandoms.first.id }
])

fanworks = Fanwork.create([
  { title: 'Broken Hallelujahs', link: 'https://www.fanfiction.net/s/7472292/1/Broken-Hallelujahs', fandom_id: fandoms.first.id }
])
