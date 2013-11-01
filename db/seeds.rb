# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(name: 'Jack Lalley', username: 'Jack', email: 'jack@jack.com', password: 'jack', password_confirmation:'jack', role: 'admin')
user2 = User.create!(name: 'Noel Gallagher', username: 'Gallagher13', email: 'noel@noel.com', password: 'noel', password_confirmation: 'noel', role: 'user')

track1 = Track.create!(title: 'Oasis - Wonderwall')
track2 = Track.create!(title: 'Beyonce - Halo')
track3 = Track.create!(title: 'Chris Brown - Forever')
track4 = Track.create!(title:'Rihanna - Stay')


user2.tracks << track1
user2.tracks << track2
user1.tracks << track3
user1.tracks << track4