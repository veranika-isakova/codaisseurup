# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Registration.destroy_all
Document.destroy_all
Photo.destroy_all
Category.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all
#Registration.destroy_all

#users
arno = User.create!(
  email: 'arno@codaisseur.com',
  password: '123456'
)
valerii = User.create!(
  email: "valerii@odaisseur.com",
  password: "123456"
)

#categories
travel = Category.create(name: "Travel")
photo = Category.create(name:"Photo")
nature = Category.create(name:"Nature")
city = Category.create(name:"City")

#events
event_1 = Event.create!(
  name: "Photo Tour",
  description: "Let's go!",
  location: "Amsterdam",
  price: 10,
  capacity: 10,
  includes_food: false,
  includes_drinks: false,
  starts_at: Date.parse('12-12-2017'),
  ends_at: Date.parse('13-12-2017'),
  active: true,
  user: arno,
  categories: [photo, city]
  )
  #photos: [photo1, photo2, photo3]

event_2 = Event.create!(
    name: "Camping",
    description: "Tired of the same scenery, the dirty, hot gyms? Then get outside and enjoy the beautiful Rotterdam weather and get in your best shape with Camping Rotterdam! ",
    location: "Rotterdam",
    price: 30,
    capacity: 12,
    includes_food: true,
    includes_drinks: true,
    starts_at: Date.parse('20-08-2018'),
    ends_at: Date.parse('23-08-2018'),
    active: true,
    user: valerii,
    categories: [travel, nature]
  )
    #photos: [photo4, photo5, photo6]

#photos
photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510227235/jordaan-amsterdam_h68htt.jpg", event: event_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510227235/GettyImages-618066222-58a7a9565f9b58a3c9d780d3_ri9yay.jpg", event: event_1)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510227235/armsterdam-canal-2_stxaju.jpg", event: event_1)

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510227235/camping1_hepmwj.jpg", event: event_2)
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510227235/best-camping-spots-Brisbane_mlriaf.png", event: event_2)
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/veranikaisakova/image/upload/v1510227235/17-0324_free-camping-bc_ivkyf2.jpg", event: event_2)
#registration

Registration.create!(event: event_1, user: arno, status: true , price: 10, guests_count: 3)
Registration.create!(event: event_2, user: valerii, status: false , price: 30, guests_count: 3)
