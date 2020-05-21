# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderList.create!(
	postage: 800,
	customer_id: 1,
	total_price: 1485,
	payment_method: 0,
	shipping_name: "佐藤一郎",
	postal_code: "8888888",
	address: "アメリカワシントン州1-1-1",
)

OrderDetail.create!(
	product_id: 1,
	order_list_id: 1,
	price: 495,
	number: 3,
)