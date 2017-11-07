# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

arno = User.create!(
  email: 'arno@codaisseur.com',
  password: '123456'
)

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
  user: arno)
