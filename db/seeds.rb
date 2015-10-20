# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.delete_all
Post.create!(id: 1, title: "Welcome to my site", body: "Welcome!  This is an example post", published_at: Time.now - 2.hours)
Post.create!(id: 2, title: "My Second Post", body: "Welcome!  This is another example post", published_at: Time.now - 1.hours)
Post.create!(id: 3, title: "Welcome to my site", body: "My third post", published_at: nil)