require 'random_data'

50.times do
   Wiki.create!(
     title:  Faker::Friends.character,
     body:   Faker::Friends.quote
   )
 end
 wikis = Wiki.all

10.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end
premium = User.create!(
  email:    'premium@example.com',
  password: 'password',
  password_confirmation: 'password',
  role:     'premium'
)
users = User.all

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
