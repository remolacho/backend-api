# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_admin = User.find_or_create_by(email: 'admin@step.cl')
user_admin.password = 'etiner123123123!'
user_admin.password_confirmation = 'etiner123123123!'
user_admin.firstname = 'Admin'
user_admin.lastname = 'admin'
user_admin.save
user_admin.add_role :admin