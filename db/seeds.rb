# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


house1 = House.create(name:'house1', price: 100, description: 'This is house 1', country:'US', city:"Los Angeles", address:"100 cool street", property_type:"house", image_url:'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')

user1 = User.create(name: 'user1', email:'user1@mail.com')
booking1 = Booking.create(user_id: 1, house_id:1, date:'2020-01-01')