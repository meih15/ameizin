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
  Cart.delete_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('categories')
  ApplicationRecord.connection.reset_pk_sequence!('products')
  ApplicationRecord.connection.reset_pk_sequence!('carts')

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
    product_name: 'Nintendo Switch – OLED Model w/ White Joy-Con',       
    description: "Introducing the newest member of the Nintendo Switch family

Play at home on the TV or on-the-go with a vibrant 7-inch OLED screen with the Nintendo Switch – OLED Model system. In addition to a new screen with vivid colors and sharp contrast, the Nintendo Switch – OLED Model includes a wide adjustable stand for more comfortable viewing angles, a dock with a wired LAN port for TV mode (LAN cable sold separately), 64GB of internal storage, and enhanced audio in Handheld and Tabletop modes using the system’s speakers.

*There may be software where the game experience may differ due to the new capabilities of the system, such as the larger screen size.

",              
    bullets: ["7-inch OLED screen - Enjoy vivid colors and crisp contrast with a screen that makes colors pop", "Wired LAN port - Use the dock’s LAN port when playing in TV mode for a wired internet connection", 
      "64 GB internal storage - Save games to your system with 64 GB of internal storage", 
    "Enhanced audio – Enjoy enhanced sound from the system’s onboard speakers when playing in Handheld and Tabletop modes.", 
    "Wide adjustable stand – Freely angle the system’s wide, adjustable stand for comfortable viewing in Tabletop mode. Nintendo Switch – OLED Model supports all Joy-Con controllers and Nintendo Switch software"],     
    price: 349.99,          
    inventory: 100,       
    category_id: 1 
  )

  Product.create!(
    product_name: 'Xbox Series X',       
    description: "Introducing Xbox Series X, the fastest, most powerful Xbox ever. Play thousands of titles from four Generations of Consoles - all games look and play best on Xbox Series X. At the heart of Series X is the Xbox Velocity architecture, which pairs a custom SSD with integrated software for faster, streamlined gameplay with significantly reduced load times. Seamlessly move between multiple games in a Flash with quick resume. Explore rich new worlds and enjoy the action like never before with the unmatched 12 Teraflops of raw graphic processing power. Enjoy 4K gaming at up to 120 frames per second, advanced 3D spatial sound, and more. Get started with an instant library of 100+ high-quality games, including all new Xbox Game Studios titles the day they launch like Halo Infinite, with Xbox Game Pass Ultimate (membership sold separately).",              
    bullets: ['Introducing Xbox Series X, the fastest, most powerful Xbox ever. Play thousands of titles from four generations of consoles-all games look and play best on Xbox Series X.', "Experience next-gen speed and performance with the Xbox velocity architecture, powered by a custom SSD and integrated software.", 
      "Play thousands of games from 4 generations of Xbox with Backward compatibility, including optimized titles at launch.",
    "Download and play over 100 high-quality games, including all new Xbox Game Studios titles like Halo Infinite the day they release, with Xbox Game Pass ultimate (membership sold separately).", 
    "Xbox Smart delivery ensures you play the best available version of your game no matter which Console you're playing on."],    
    price: 499.99,          
    inventory: 0,      
    category_id: 1
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
    product_name: 'PlayStation 5 Console CFI-1215A01X',       
    description: 'The PS5 console unleashes new gaming possibilities that you never anticipated. Experience lightning fast loading with an ultra-high speed SSD, deeper immersion with support for haptic feedback, adaptive triggers, and 3D Audio, and an all-new generation of incredible PlayStation games.',              
    bullets: ["Model Number CFI-1215A01X", 
      "Stunning Games - Marvel at incredible graphics and experience new PS5 features.",
    "Breathtaking Immersion - Discover a deeper gaming experience with support for haptic feedback, adaptive triggers, and 3D Audio technology.",
  "Lightning Speed - Harness the power of a custom CPU, GPU, and SSD with Integrated I/O that rewrite the rules of what a PlayStation console can do."],     
    price: 499.00,          
    inventory: 2,       
    category_id: 1 
  )


    Product.create!(
    product_name: 'Logitech G713 Wired Mechanical Gaming Keyboard Clicky + Logitech G705 Wireless Gaming Mouse - White Mist',       
    description: 'Keyboard, Mouse, Wrist Rest',              
    bullets: ["Cloud-soft Comfort: Float away with G713’s dreamy white design and comfy, cloud-shaped palm rest; compact mechanical TKL keyboard layout and adjustable height give that good game feeling, all-day long",
    "Lovely Lighting: Per key and perimeter Logitech LIGHTSYNC RGB with preloaded Play Mood animations, the Aurora Collection signature lighting; customize your RGB gaming keyboard’s lighting on G HUB",
  "Always On: You’re always ready to play, simple and worry-free, with wired USB-C keyboard connectivity", 
"Smaller Fit: Compact small gaming mouse with an intentional design crafted to fit your hand",
"Contoured Comfort: Logitech Wireless Mouse with a comfy, compact, and sculpted design features thumb rest, gliding feet, and lightweight maneuverability at only 85 g",
"Play On: Rechargeable wireless gaming mouse with a long-lasting battery (with full lighting) for up to 40 gaming-hours, Logitech LIGHTSPEED wireless technology and Bluetooth enabled"],    
    price: 269.98,          
    inventory: 1000,      
    category_id: 1
  )



    Product.create!(
    product_name: "Kirby’s Return to Dream Land™ Deluxe - Nintendo Switch",       
    description: "Adventure through Dream Land with Kirby and his allies—solo or with friends!

 

The tough puff Kirby is back for a 1-4 player* platforming adventure across Planet Popstar. Copy enemies’ abilities and use their power to breathe fire, attack with a sword, wield a whip, and more! Shoot lasers and kick up a sandstorm with the brand-new Mecha and Sand Copy Abilities. Sometimes you’ll even need to unleash a powerful Super Ability to clear the way. In multiplayer, your friends can choose from Kirby, King Dedede, Meta Knight, and Bandana Waddle Dee as you float along and find Magolor’s missing ship pieces.

 

Visit Merry Magoland and play a colorful collection of subgames

 

Travel from Planet Popstar to Merry Magoland with the press of a button to share the fun with up to 3 additional friends as you compete on the same system*! Play returning subgames like Samurai Kirby as well as brand-new ones like Magolor’s Tome Trackers and Booming Blasters for in-game rewards. Hop online** to see global fun facts or compete against player records from all over the world in Samurai Kirby 100.

",              
    bullets: ["Join Kirby in a 1-4 player* collaborative adventure and competitive subgame attractions",
    "Help Magolor rebuild his ship with Copy Abilities like Fire, Whip, Mecha, and Sand in the main adventure", 
    "Play returning subgames like Samurai Kirby, as well as new ones like Magolor’s Tome Trackers and Booming Blasters in the Merry Magoland amusement park",
  "Bring along friends* to play on the same system and choose characters like King Dedede, Meta Knight, and Bandana Waddle Dee. You can even play as four Kirbys!"],    
    price: 59.99,          
    inventory: 10,      
    category_id: 1
  )

  # 7 

  Product.create!(
    product_name: 'The lightest and most compact Kindle, now with a 6” 300 ppi high-resolution display, and 2x the storage - Black',       
    description: 'All-new Kindle (2022 release)',              
    bullets: ["The lightest and most compact Kindle, now with a 300 ppi high-resolution display for sharp text and images.",
    "Read comfortably with a glare-free, paper-like display. The adjustable front light and dark mode make reading effortless, day and night.",
  "Get lost in your story. Tune out messages, emails, and social media with a distraction-free device specifically made for reading.",
"Now with extended battery life – A single charge via USB-C lasts up to 6 weeks.",
"Now with 16 GB to store thousands of books – Double the storage capacity of the previous generation.",
"Find new stories – With Kindle Unlimited, get unlimited access to over 2 million titles, thousands of audiobooks, and more.",
"Designed with sustainability in mind. This Kindle uses 30-75% recycled plastics and 90% recycled magnesium and has 100% recyclable device packaging."],    
    price: 99.99,          
    inventory: 10000,      
    category_id: 1
  )

  # 8

  Product.create!(
    product_name: "INSIGNIA All-New 24-inch Class F20 Series Smart HD 720p Fire TV (NS-24F201NA23, 2022 Model)",
    bullets: ["720p resolution - View your favorite movies, shows and games in high definition.",
    "Alexa voice control - The Alexa Voice Remote lets you easily control your entertainment, search across apps, switch inputs, and more using just your voice. Press and hold the voice button and ask Alexa to easily find, launch, and control content, and even switch to cable.",
  "Fire TV experience built-in - Watch over 1 Million streaming movies and TV episodes with access to tens of thousands of channels, apps, and Alexa skills.",
"Supports Apple AirPlay - Share videos, photos, music and more from an Apple device to your TV with the touch of a button.",
"Supports HDMI ARC - Sends audio directly from the HDMI jack to a compatible soundbar or AV receiver, removing the need for an extra cable."],
    description: "Access live over-the-air channels and streaming with this 24-inch TV—and control it all with your voice. Ask Alexa to launch apps, search for titles and more. An HD experience in 720p provides crystal clear images. You won’t miss a second with the Insignia NS-24F201NA23 24 inches Class F20 Series LED HD Smart Fire TV.",
    price: 89.99,
    inventory: 20000,
    category_id: 1
  )

  #9

  Product.create!(
    product_name: "Echo Show 5 (2nd Gen, 2021 release) | Smart display with Alexa and 2 MP camera | Deep Sea Blue",
    bullets: ["See your day clearly with Alexa at the ready - Set alarms and timers, check your calendar or the news, make video calls with the 2 MP camera, and stream music or shows - all with your voice.",
    "Add Alexa to your nightstand - Ease into the day with a routine that turns compatible lights on gradually. Or wake up to your news update, the weather forecast, and your favorite music.",
  "Manage your smart home - Look in when you're away with the built-in camera. Control compatible devices like cameras, lights, and more using the interactive display, your voice, or your motion.",
"Connect with video calling - Use the 2 MP camera to call friends and family who have the Alexa app or an Echo device with a screen. Make announcements to other compatible devices in your home.",
"Be entertained - Ask Alexa to play TV shows and movies via Prime Video, Netflix, and more on the 5.5 inches screen. Or stream favorites from Amazon Music, Apple Music, Spotify, and others. Subscriptions for some services required.",
"Put photos on (smart) display - Use Amazon Photos or Facebook to turn your home screen into a digital frame.",
"Designed to protect your privacy - Amazon is not in the business of selling your personal information to others. Built with multiple layers of privacy controls including a mic/camera off button and a built-in camera shutter."],
    description: "Echo Show 5",
    price: 84.99,
    inventory: 40000,
    category_id: 1
  )

  #10

  Product.created!(
    product_name: "Lenovo 2022 Newest Ideapad 3 Laptop, 15.6 inches HD Touchscreen, 11th Gen Intel Core i3-1115G4 Processor, 8GB DDR4 RAM, 256GB PCIe NVMe SSD, HDMI, Webcam, Wi-Fi 5, Bluetooth, Windows 11 Home, Almond",
    
  )


  puts "Done!"

end