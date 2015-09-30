User.destroy_all
Item.destroy_all

require 'faker'

example = User.new(
  name:     'example User',
  email:    'User@example.com',
  password: 'helloworld',
  password_confirmation: "helloworld",
  activated: true,
  activated_at: Time.zone.now
  )
  example.save!

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: 'helloworld',
    password_confirmation: "helloworld",
    activated: true,
    activated_at: Time.zone.now   
    )
    user.save!
end
users = User.all

 50.times do
   item = Item.create!(
     user: users.sample,
     name: Faker::Lorem.sentence
   )
   item.update_attributes!(created_at: rand(10.minutes .. 1.week).ago)
 end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"