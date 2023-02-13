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
  Category.create!(category_name: 'Toys');


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
    inventory: 0,      
    category_id: 2
  )

    Product.create!(
    product_name: 'Pokémon Violet - Nintendo Switch',       
    description: "The newest chapters in the Pokémon series are coming to the Nintendo Switch system later this year. Catch, battle, and train Pokémon in the Paldea Region, a vast land filled with lakes, towering peaks, wastelands, small towns, and sprawling cities. There is no set path, so you can adventure freely through three grand stories. In one such story, you can challenge Pokémon Gyms in any order you desire as you aim for the Champion Rank! Explore a wide-open world at your own pace and traverse land, water, and air by riding on the form-shifting Legendary Pokémon Miraidon. Choose either Sprigatito, Fuecoco, or Quaxly, to be your first partner Pokémon before setting off on your journey through Paldea.

Pokémon in the Paldea region have the ability to Terastallize to gain special power. When a Pokémon Terastallizes, a Tera Jewel appears above its head like a crown, and the Pokémon’s body glistens like a cut gemstone. Each Pokémon has a Tera Type that remains inactive until the Pokémon Terastallizes. For example, most Eevee will have a Normal Tera Type, but some other Eevee have a Flying Tera Type! When a Terastallized Pokémon uses a move that matches its Tera Type and at least one of its original types, the boost to that move’s power will be even greater! Terastallizing holds the key to victory or defeat in battles in the Paldea region.

The Paldea Region is home to a prestigious school where people from all sorts of regions come to hone their skills against each other, be it through academics or Pokémon battles. The name of the school, its emblem, its uniforms, and other details will differ depending on whether you play Pokémon Scarlet or Pokémon Violet. Take classes with unique teachers who will show you what they know about battling, Pokémon biology, and more. Embark on an independent study called the Treasure Hunt to gain new experiences, meet new people, and find your very own treasure.",              
    bullets: ['Embark on a new Pokémon adventure',
              'Catch, battle, and train Pokémon in the Paldea Region, a vast land filled with lakes, towering peaks, wastelands, small towns, and sprawling cities.',
              'Choose either Sprigatito, Fuecoco, or Quaxly, to be your first partner Pokémon before setting off on your journey through Paldea.',
              'Embark on an independent study called the Treasure Hunt to gain new experiences, meet new people, and find your very own treasure.'
              ],    
    price: 52.00,          
    inventory: 19,      
    category_id: 1
  )

    Product.create!(
    product_name: 'Pokémon Scarlet - Nintendo Switch',       
    description: "The newest chapters in the Pokémon series are coming to the Nintendo Switch system later this year. Catch, battle, and train Pokémon in the Paldea Region, a vast land filled with lakes, towering peaks, wastelands, small towns, and sprawling cities. There is no set path, so you can adventure freely through three grand stories. In one such story, you can challenge Pokémon Gyms in any order you desire as you aim for the Champion Rank! Explore a wide-open world at your own pace and traverse land, water, and air by riding on the form-shifting Legendary Pokémon Miraidon. Choose either Sprigatito, Fuecoco, or Quaxly, to be your first partner Pokémon before setting off on your journey through Paldea.

Pokémon in the Paldea region have the ability to Terastallize to gain special power. When a Pokémon Terastallizes, a Tera Jewel appears above its head like a crown, and the Pokémon’s body glistens like a cut gemstone. Each Pokémon has a Tera Type that remains inactive until the Pokémon Terastallizes. For example, most Eevee will have a Normal Tera Type, but some other Eevee have a Flying Tera Type! When a Terastallized Pokémon uses a move that matches its Tera Type and at least one of its original types, the boost to that move’s power will be even greater! Terastallizing holds the key to victory or defeat in battles in the Paldea region.

The Paldea Region is home to a prestigious school where people from all sorts of regions come to hone their skills against each other, be it through academics or Pokémon battles. The name of the school, its emblem, its uniforms, and other details will differ depending on whether you play Pokémon Scarlet or Pokémon Violet. Take classes with unique teachers who will show you what they know about battling, Pokémon biology, and more. Embark on an independent study called the Treasure Hunt to gain new experiences, meet new people, and find your very own treasure.",              
    bullets: ['Embark on a new Pokémon adventure',
              'Catch, battle, and train Pokémon in the Paldea Region, a vast land filled with lakes, towering peaks, wastelands, small towns, and sprawling cities.',
              'Choose either Sprigatito, Fuecoco, or Quaxly, to be your first partner Pokémon before setting off on your journey through Paldea.',
              'Embark on an independent study called the Treasure Hunt to gain new experiences, meet new people, and find your very own treasure.'
              ],    
    price: 52.00,          
    inventory: 18,      
    category_id: 1
  )  



  Product.create!(
    product_name: 'Nintendo Switch OLED',       
    description: 'Device to play games',              
    bullets: ['has joycon', 'can play games'],     
    price: 349.99,          
    inventory: 2,       
    category_id: 1 
  )


    Product.create!(
    product_name: 'Foundation',       
    description: 'sun protection',              
    bullets: ['perfect shade'],    
    price: 15.00,          
    inventory: 0,      
    category_id: 2
  )



    Product.create!(
    product_name: 'Blush',       
    description: 'color to your face',              
    bullets: ['perfect shade'],    
    price: 15.00,          
    inventory: 10,      
    category_id: 2
  )


  Product.create!(
    product_name: 'Lipstick',       
    description: 'color to your face',              
    bullets: ['perfect shade'],    
    price: 25.00,          
    inventory: 10,      
    category_id: 2
  )


  puts "Done!"

end