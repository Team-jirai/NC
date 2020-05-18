# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductGenre.create!(genre: 'ケーキ')
Product.create!(product_genre_id: 1,name: 'キャラメルケーキ',description: '美味しい美味しいキャラメルケーキです',price: '350',picture_id: File.open('./app/assets/images/caramel.jpeg'))
Product.create!(product_genre_id: 1,name: '栗ケーキ',description: '美味しい栗さんのケーキです',price: '4000',picture_id: File.open('./app/assets/images/toptop.jpeg'))
Product.create!(product_genre_id: 1,name: 'ショートケーキ',description: 'まずいショートケーキです',price: '40',picture_id: File.open('./app/assets/images/toptop.jpeg'))