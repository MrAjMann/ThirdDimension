# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



JohnDoe = User.create(:first_name => 'John',:last_name => 'Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')

SallyHarper = (User.create :first_name => 'Sally',:last_name => 'Harper', :email => 'sally@gmail.com', :password => 'hotsauce', :password_confirmation => 'hotsauce')
puts "Users created: #{User.all.count}"

#Catagories






