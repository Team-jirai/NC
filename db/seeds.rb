# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductGenre.create!(
	[
         {
           genre: 'ケーキ'
         }
	]
)


Product.create!(
    [
        {
        	product_genre_id: 1,
            name: 'ショートケーキ',
            description: "ケーキ",
        }
    ]
)