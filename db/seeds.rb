# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@gmail.com', password: 'admin', password_confirmation: 'admin', role: :admin)
User.create(email: 'guest@gmail.com', password: 'guest', password_confirmation: 'guest', role: :guest)
User.create(email: 'teacher@gmail.com', password: 'teacher', password_confirmation: 'teacher', role: 1)
User.create(email: 'student@gmail.com', password: 'student', password_confirmation: 'student', role: 2)
