# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Rental.destroy_all
Board.destroy_all
User.destroy_all

# CREATE USERS
user1 = User.new(
  email:    "bill@gmail.com",
  password: "password",
  name: "bill"
  )
user1.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/headshot_1.jpg')), filename: 'headshot_1.jpg')
user1.save!

user2 = User.new(
  email:    "michael@gmail.com",
  password: "password",
  name: "mike"
  )
user2.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/headshot_2.jpg')), filename: 'headshot_2.jpg')
user2.save!

user3 = User.new(
  email:    "cameron@gmail.com",
  password: "password",
  name: "cameron"
  )
user3.photo.attach(io: File.open(Rails.root.join('db/fixtures/users/headshot_3.jpg')), filename: 'headshot_3.jpg')
user3.save!

# CREATE BOARDS
board1 = Board.new(
  location: "Rennes",
  description: "cool board for beginners",
  title: "Soft Board 8 ft",
  height: (8 * 12),
  volume: 33.2,
  brand: "Wavestorm",
  condition: "good",
  price_per_day: 1500
  )
board1.user = user1
board1.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_1.jpg')), filename: 'surfboard_1.jpg')
board1.save

board2 = Board.new(
    location: "St-Brieuc",
    description: "for advanced surfers",
    title: "Performance board quad fin setup",
    height: 185,
    volume: 3555,
    brand: "Firewire",
    condition: "Almost new",
    price_per_day: 3200
  )
board2.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_2.jpg')), filename: 'surfboard_2.jpg')
board2.user = user2
board2.save

board3 = Board.new(
    location: "St-Brieuc",
    description: "for advanced surfers",
    title: "Soft top for intermediate",
    height: 84,
    volume: 32.22,
    brand: "Firewire",
    condition: "Almost new",
    price_per_day: 2500
  )
board3.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_3.jpg')), filename: 'surfboard_3.jpg')
board3.user = user3
board3.save

board4 = Board.new(
    location: "Paris",
    description: "for advanced surfers",
    title: "Fish setup for small waves",
    height: 165,
    volume: 34.44,
    brand: "DHD",
    condition: "very used",
    price_per_day: 2300
  )
board4.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_4.jpg')), filename: 'surfboard_4.jpg')
board4.user = user3
board4.save

board5 = Board.new(
    location: "Dinan",
    description: "Has some dings but dont mind if you go crazy",
    title: "Mid range 5'10\" ",
    height: (5 * 10 + 10),
    volume: 35.55,
    brand: "Firewire",
    condition: "Almost new",
    price_per_day: 2100
  )
board5.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_5.jpg')), filename: 'surfboard_5.jpg')
board5.user = user1
board5.save

board6 = Board.new(
    location: "St-Brieuc",
    description: "for advanced surfers",
    title: "Firewire 6'0\" ",
    height: 185,
    volume: 28.87,
    brand: "Firewire",
    condition: "ok",
    price_per_day: 2200
  )
board6.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_6.jpg')), filename: 'surfboard_6.jpg')
board6.user = user3
board6.save

board7 = Board.new(
    location: "Rennes",
    description: "for advanced surfers",
    title: "DHD 6'8\" board ",
    height: (6 * 8 + 8),
    volume: 36.55,
    brand: "Firewire",
    condition: "Almost new",
    price_per_day: 2900
  )
board7.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_7.jpg')), filename: 'surfboard_7.jpg')
board7.user = user2
board7.save

board8 = Board.new(
    location: "St-Brieuc",
    description: "nice groovy board for beginners",
    title: "Longboard 10'0\" ",
    height: 120,
    volume: 45.55,
    brand: "Clayton",
    condition: "new",
    price_per_day: 3300
  )
board8.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_8.jpg')), filename: 'surfboard_8.jpg')
board8.user = user1
board8.save

board9 = Board.new(
    location: "",
    description: "not too shabby",
    title: "Lost board 7'6\"",
    height: (7 * 12 + 6),
    volume: 35.55,
    brand: "Firewire",
    condition: "Almost new",
    price_per_day: 2500
  )
board9.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_9.jpg')), filename: 'surfboard_9.jpg')
board9.user = user2
board9.save

board10 = Board.new(
    location: "Quiberon",
    description: "Easy for any type of day",
    title: "Soft top 4' 10\"",
    height: (4*12 + 10),
    volume: 39.55,
    brand: "Channel Islands",
    condition: "Almost new",
    price_per_day: 3500
  )
board10.photo.attach(io: File.open(Rails.root.join('db/fixtures/boards/surfboard_10.jpg')), filename: 'surfboard_10.jpg')
board10.user = user1
board10.save

# CREATE RENTALS
rental1 = Rental.new(
  start_date: Time.now,
  end_date: (Time.now + 240000),
  total_price: 0
)
rental1.user = user1
rental1.board = board2
rental1.total_price = rental1.board.price_per_day / 100
rental1.save

rental2 = Rental.new(
  start_date: Time.now,
  end_date: (Time.now + 240000),
  total_price: 0
)
rental2.user = user1
rental2.board = board4
rental2.total_price = rental2.board.price_per_day / 100
rental2.save
