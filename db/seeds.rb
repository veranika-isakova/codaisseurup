# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
User.destroy_all

arno = User.create!(
  email: 'arno@codaisseur.com',
  password: '123456'
)
valerii = User.create!(
  email: "valerii@odaisseur.com",
  password: "123456"
)
travel = Category.create(name: "Travel")
photo = Category.create(name:"Photo")
nature = Category.create(name:"Nature")
city = Category.create(name:"City")

Event.create!(
  name: "Photo Tour",
  description: "I want to make photos of the massive fields of tulips, windmills, canals, and unique small towns and villages",
  location: "Amsterdam",
  price: 10,
  capacity: 10,
  includes_food: false,
  includes_drinks: false,
  starts_at: Date.parse('12-12-2017'),
  ends_at: Date.parse('13-12-2017'),
  active: true,
  user: arno,
  categories: [photo, city])

  Event.create!(
    name: "Camping",
    description: "Tired of the same scenery, the dirty, hot gyms? Then get outside and enjoy the beautiful Rotterdam weather and get in your best shape with Boot Camp Amsterdam! ",
    location: "Rotterdam",
    price: 30,
    capacity: 12,
    includes_food: true,
    includes_drinks: true,
    starts_at: Date.parse('20-08-2018'),
    ends_at: Date.parse('23-08-2018'),
    active: true,
    user: valerii,
    categories: [travel, nature])
