require 'random_data'
10.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end

premium = User.create!(
  email:    'premium2@example.com',
  password: 'password',
  password_confirmation: 'password',
  role:     'premium'
)
users = User.all

50.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::Coffee.blend_name,
     body:   Faker::Coffee.notes
   )
 end
 wikis = Wiki.all

 puts "Seed finished"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created"
