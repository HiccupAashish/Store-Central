# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create(name: "Aashish", email: "shahaashish22@gmail.com")
# user=User.create(name: "Michael Hartl", email: "mhartl@example.com",
#              password: "foobar", password_confirmation: "foobar")
product= Product.create(name: "Chow-mein", price: 25, quantity:3)

cat=Category.create(name: "Noodles", total_product: 1)
