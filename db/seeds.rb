# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Category.destroy_all
  Product.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('categories')
  ApplicationRecord.connection.reset_pk_sequence!('products')

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    user_name: 'Demo-lition', 
    email: 'demo@user.io', 
    password: 'password'
  )

  # More users
  10.times do 
    User.create!({
      user_name: Faker::Internet.unique.username(specifier: 3),
      email: Faker::Internet.unique.email,
      password: 'password'
    }) 
  end


  puts "Creating categories..."

  Category.create!(category_name: 'Electronics');
  Category.create!(category_name: 'Beauty');

  puts "Creating products..."

  Product.create!(
    product_name: 'Nintendo Switch',       
    description: 'Device to play games',              
    bullets: ['has joycon', 'can play games'],     
    price: 349.99,          
    inventory: 100,       
    category_id: 1 
  )

  Product.create!(
    product_name: 'Sunscreen',       
    description: 'sun protection',              
    bullets: ['no white-cast'],    
    price: 10.00,          
    inventory: 250,      
    category_id: 2
  )

  puts "Done!"

end