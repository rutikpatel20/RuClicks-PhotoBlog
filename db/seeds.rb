# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |i|
  blog = Blog.new
  blog.title = Faker::Lorem.sentence(word_count: 3)
  blog.subtitle = Faker::Lorem.sentences(number: 1)
  # seed image from local
  blog.photo.attach(io: File.open("#{Rails.root}/app/assets/images/laptop.jpeg"), filename: "#{i}_photo.jpeg")
  blog.thumbnail.attach(io: File.open("#{Rails.root}/app/assets/images/thumbnail-dummy.png"), filename: "#{i}_thumbnail.png")
  blog.user = User.first
  blog.views = Faker::Number.number(digits: 3)
  blog.save
  puts "------------ Blog #{i} Saved ------------"
end
AdminUser.create!(email: "admin@example.com", username: "admin", password: "password", password_confirmation: "password") if Rails.env.development?
