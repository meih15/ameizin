# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Category.destroy_all
  Product.destroy_all
  Cart.destroy_all
  CartItem.destroy_all
  Review.destroy_all
  

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('categories') 
  ApplicationRecord.connection.reset_pk_sequence!('products')
  ApplicationRecord.connection.reset_pk_sequence!('carts')
  ApplicationRecord.connection.reset_pk_sequence!('cart_items')
  ApplicationRecord.connection.reset_pk_sequence!('reviews')


  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    user_name: 'Demo-lition', 
    email: 'demo@user.io', 
    password: 'password'
  )

  # More users
  # 10.times do 
  #   User.create!({
  #     user_name: Faker::Internet.unique.username(specifier: 3),
  #     email: Faker::Internet.unique.email,
  #     password: 'password'
  #   }) 
  # end


  puts "Creating categories..."

  Category.create!(category_name: 'Electronics');
  Category.create!(category_name: 'Beauty & Personal Care');
  Category.create!(category_name: 'Books');
  Category.create!(category_name: 'Excercise & Fitness');
  Category.create!(category_name: 'Jewelry');
  Category.create!(category_name: 'Clothing');
  Category.create!(category_name: 'Food & Grocery');
  Category.create!(category_name: 'Pet Supplies');


  puts "Creating products..."

  #1

  p1 = Product.create!(
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
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nintendo-switch-white-joycon.jpg'
  )

  # p1.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nintendo-switch-white-joycon.jpg'),
  #   filename: "white-nintendo"
  # })

  #2

  p2 = Product.create!(
    product_name: 'Xbox Series X',       
    description: "Introducing Xbox Series X, the fastest, most powerful Xbox ever. Play thousands of titles from four Generations of Consoles - all games look and play best on Xbox Series X. At the heart of Series X is the Xbox Velocity architecture, which pairs a custom SSD with integrated software for faster, streamlined gameplay with significantly reduced load times. Seamlessly move between multiple games in a Flash with quick resume. Explore rich new worlds and enjoy the action like never before with the unmatched 12 Teraflops of raw graphic processing power. Enjoy 4K gaming at up to 120 frames per second, advanced 3D spatial sound, and more. Get started with an instant library of 100+ high-quality games, including all new Xbox Game Studios titles the day they launch like Halo Infinite, with Xbox Game Pass Ultimate (membership sold separately).",              
    bullets: ['Introducing Xbox Series X, the fastest, most powerful Xbox ever. Play thousands of titles from four generations of consoles-all games look and play best on Xbox Series X.', "Experience next-gen speed and performance with the Xbox velocity architecture, powered by a custom SSD and integrated software.", 
      "Play thousands of games from 4 generations of Xbox with Backward compatibility, including optimized titles at launch.",
    "Download and play over 100 high-quality games, including all new Xbox Game Studios titles like Halo Infinite the day they release, with Xbox Game Pass ultimate (membership sold separately).", 
    "Xbox Smart delivery ensures you play the best available version of your game no matter which Console you're playing on."],    
    price: 499.99,          
    inventory: 0,      
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/xbox-series-x.jpg'
  )

  # p2.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/xbox-series-x.jpg'),
  #   filename: "xbox"
  # })

  #3

    p3 = Product.create!(
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
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pokemon-violet.jpg"
  )

  # p3.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pokemon-violet.jpg'),
  #   filename: "pokemon-violet"
  # })

  #4
  p4 = Product.create!(
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
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pokemon-scarlet.jpg'
  )  

  # p4.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pokemon-scarlet.jpg'),
  #   filename: 'pokemon-scarlet'
  # })

  #5
  p5 = Product.create!(
    product_name: 'PlayStation 5 Console CFI-1215A01X',       
    description: 'The PS5 console unleashes new gaming possibilities that you never anticipated. Experience lightning fast loading with an ultra-high speed SSD, deeper immersion with support for haptic feedback, adaptive triggers, and 3D Audio, and an all-new generation of incredible PlayStation games.',              
    bullets: ["Model Number CFI-1215A01X", 
      "Stunning Games - Marvel at incredible graphics and experience new PS5 features.",
    "Breathtaking Immersion - Discover a deeper gaming experience with support for haptic feedback, adaptive triggers, and 3D Audio technology.",
  "Lightning Speed - Harness the power of a custom CPU, GPU, and SSD with Integrated I/O that rewrite the rules of what a PlayStation console can do."],     
    price: 499.00,          
    inventory: 2,       
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/playstation-5.jpg'
  )

  # p5.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/playstation-5.jpg'),
  #   filename: "playstation-5"
  # })

    #6
  p6 = Product.create!(
    product_name: 'Logitech G713 Wired Mechanical Gaming Keyboard Clicky + Logitech G705 Wireless Gaming Mouse - White Mist',       
    description: 'Keyboard, Mouse, Wrist Rest',              
    bullets: ["Cloud-soft Comfort: Float away with G713’s dreamy white design and comfy, cloud-shaped palm rest; compact mechanical TKL keyboard layout and adjustable height give that good game feeling, all-day long",
    "Lovely Lighting: Per key and perimeter Logitech LIGHTSYNC RGB with preloaded Play Mood animations, the Aurora Collection signature lighting; customize your RGB gaming keyboard’s lighting on G HUB",
  "Always On: You’re always ready to play, simple and worry-free, with wired USB-C keyboard connectivity", 
"Smaller Fit: Compact small gaming mouse with an intentional design crafted to fit your hand",
"Contoured Comfort: Logitech Wireless Mouse with a comfy, compact, and sculpted design features thumb rest, gliding feet, and lightweight maneuverability at only 85 g",
"Play On: Rechargeable wireless gaming mouse with a long-lasting battery (with full lighting) for up to 40 gaming-hours, Logitech LIGHTSPEED wireless technology and Bluetooth enabled"],    
    price: 269.98,          
    inventory: 100,      
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/logitech-white.jpg'
  )

  # p6.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/logitech-white.jpg'),
  #   filename: "logitech-white.jpg"
  # })


  #7
  p7 = Product.create!(
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
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kirby-switch.jpg'
  )

  # p7.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kirby-switch.jpg'),
  #   filename: "kirby-switch"
  # })


  # 8

  p8 = Product.create!(
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
    inventory: 100,      
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kindle.jpg'
  )

  # p8.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kindle.jpg'),
  #   filename: "kindle"
  # })

  # 9

  p9 = Product.create!(
    product_name: "INSIGNIA All-New 24-inch Class F20 Series Smart HD 720p Fire TV (NS-24F201NA23, 2022 Model)",
    bullets: ["720p resolution - View your favorite movies, shows and games in high definition.",
    "Alexa voice control - The Alexa Voice Remote lets you easily control your entertainment, search across apps, switch inputs, and more using just your voice. Press and hold the voice button and ask Alexa to easily find, launch, and control content, and even switch to cable.",
  "Fire TV experience built-in - Watch over 1 Million streaming movies and TV episodes with access to tens of thousands of channels, apps, and Alexa skills.",
"Supports Apple AirPlay - Share videos, photos, music and more from an Apple device to your TV with the touch of a button.",
"Supports HDMI ARC - Sends audio directly from the HDMI jack to a compatible soundbar or AV receiver, removing the need for an extra cable."],
    description: "Access live over-the-air channels and streaming with this 24-inch TV—and control it all with your voice. Ask Alexa to launch apps, search for titles and more. An HD experience in 720p provides crystal clear images. You won’t miss a second with the Insignia NS-24F201NA23 24 inches Class F20 Series LED HD Smart Fire TV.",
    price: 89.99,
    inventory: 200,
    category_id: 1,
    photourl: 'https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/insignia-tv.jpg'
  )

  # p9.photo.attach({
  #   io: URI.open('https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/insignia-tv.jpg'),
  #   filename: "insignia-tv"
  # })


  #10

  p10 = Product.create!(
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
    inventory: 400,
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/echo-dot-5.jpg"
  )

  # p10.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/echo-dot-5.jpg"),
  #   filename: "echo-5"
  # })


  #11

  p11 = Product.create!(
    product_name: "Lenovo 2023 Newest Ideapad 1i Laptop, 14 inch HD Display, Intel Quad-Core Processor, 4GB RAM, 256GB Storage, Wi-Fi 6, Bluetooth, Cloud Grey, Windows 11 Home in S Mode, Bundle with JAWFOAL",
    description: "Laptop, JAWFOAL Accessories",
    bullets: ["【Processor】 Powered by Intel Pentium N5030 Quad-Core Processor (up to 2.4 GHz) for fast and snappy performance. Perfect for running lots of tabs and apps.",
    "【Display】 14inches HD (1366x768) TN 220nits Anti-glare. Crisp images come alive on the 14 inch HD IPS display. Keep your eyes free from strain and watch or work for long sessions.",
  "【Upgraded】4GB RAM smoothly run your applications, as well as multiple programs and browser tabs all at once. 128GB eMMC+128GB MicroSD Card Capacity boots up quickly, get to files faster, and have room for loads of files with the quick solid state drive",
"【All-day Battery life】 Tackle assignments or binge watch your favorite show with up to 10 hours of battery life. All day long. Designed for all-day productivity with extended battery life.",
"【Operating System】 Windows 11 Home in S mode comes with advanced security features built right in, which can protect your rights and interests when you are online."],
    price: 299.99,
    inventory: 400,
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lenovo-2023.jpg"
  )

  # p11.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lenovo-2023.jpg"),
  #   filename: "lenovo-2023"
  # })


  #12

  p12 = Product.create!(
    product_name: "Ring Video Doorbell 3 – enhanced wifi, improved motion detection, easy installation",
    description: "Ring Video Doorbell 3, rechargeable battery pack, corner mount, USB charging cable, mounting bracket, installation tools and hardware, user manual, and security sticker. Ships with a Satin Nickel faceplate. After device set up, you will receive a digital coupon for one free additional faceplate. Select colors apply.",
    bullets: ["【1080p HD video doorbell with enhanced features that let you see, hear, and speak to anyone from your phone, tablet, or PC.",
      "An upgrade from the original Ring Video Doorbell 2, enjoy improved motion detection, privacy zones and audio privacy, and dual-band (2.4 or 5.0 GHz) wifi connectivity.",
      "Receive mobile notifications when anyone presses your doorbell or triggers your built-in motion sensors.",
    "Powered by the rechargeable battery pack or connects to doorbell wires for constant power.",
    "Easily setup by connecting your Ring Video Doorbell 3 to wifi through the Ring app and mounting with the included tools.",
    "With a Ring Protect Plan (subscription sold separately), record all your videos, review what you missed for up to 180 days, and share videos and photos.",
    "Connect your Ring doorbell with Alexa to hear announcements on your compatible Echo device when your doorbell is pressed and see a live view of your camera if you have an Echo device with a screen. Talk to visitors by saying “Alexa, talk to the front door.” With a Ring Protect Plan (subscription sold separately), Alexa can also make voice announcements and automatically show live video feed on an Echo Show, Fire TV, or Fire Tablet when your Ring Video Doorbell 3 Plus detects a person."],
    price: 149.99,
    inventory: 100,
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ring-doorbell-3.jpg"
  )

  # p12.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ring-doorbell-3.jpg"),
  #   filename: "ring-doorbell-3"
  # })


  #13
  p13 = Product.create!(
    product_name: "2021 HP Stream 14inches HD SVA Laptop Computer, Intel Celeron N4000 Processor, 4GB RAM, 64GB eMMC flash memory, Intel UHD Graphics 600, 1-Year Office, Bluetooth, Win 10S, Rose Pink, 128GB SnowBell USB Card",
    description: "#47 in Traditional Laptop Computers",
    bullets: ["14 inches diagonal HD SVA BrightView Display, 1366 x 768 resolution boasts impressive color and clarity, Anti-glare Energy-efficient WLED screen.",
    "Intel Celeron N4000 Processor, Ultra-low-voltage platform. Dual-core, two-way processing provides maximum high-efficiency power to go.",
    "4GB DDR4 RAM, Plenty of high-bandwidth RAM to smoothly run your games as well as multiple programs. 64GB eMMC flash memory, This ultracompact memory system is ideal for mobile devices and applications, providing enhanced storage capabilities, streamlined data management, quick boot-up times and support for high-definition video playback.",
    "Standard Keyboard, Allows you to enjoy comfortable and accurate typing. Intel UHD Graphics 600 with shared video memory provide solid image quality for Internet use, movies, basic photo editing and casual gaming. Stereo speakers & HP Webcam with integrated digital microphone.",
    "Windows 10 Home in S mode included. Battery life Up to 11 hours (video playback), 13.27inches x 8.9inches x 0.7inches, 3.17 lbs. 3x USB Type-A Ports, 1x HDMI, 1x Media Card Reader, 1x Headphone Jack. Wireless-AC + Bluetooth 4.2, Rose Pink, Bonus 128GB SnowBell USB Card."],
    price: 299.00,
    inventory: 100,
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/2021-hp-stream.jpg"
  )

  # p13.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/2021-hp-stream.jpg"),
  #   filename: "2021-hp-stream"
  # })

  #14

  p14 = Product.create!(
    product_name: "ASUS TUF Dash 15 (2022) Gaming Laptop, 15.6inches 144Hz FHD Display, Intel Core i7-12650H, GeForce RTX 3060, 16GB DDR5, 512GB SSD, Thunderbolt 4, Windows 11 Home, Off Black, FX517ZM-AS73",
    description: "Always ready for action, the TUF Dash F15 darts with ease between gaming, streaming, and more with Windows 11. Stream and multitask with ease thanks to a 12th Gen Intel Core i7-12650H CPU and blisteringly fast 4800MHz DDR5 RAM. Leverage the full gaming performance of the GeForce RTX 3060 GPU with a dedicated MUX Switch.",
    bullets: ["SUPERCHARGED RTX GRAPHICS - Gameplay graphics are silky smooth with the NVIDIA GeForce RTX 3060 6GB GDDR6 at 1050W with Dynamic Boost, with cutting-edge AI features like NVIDIA DLSS and Ray-Tracing",
    "MUX SWITCH BOOST - A MUX Switch lets the GPU communicate directly with the display, increasing performance and decreasing latency",
    "READY FOR ANYTHING - Use your gaming laptop to stream and multi-task with ease thanks to an  Intel Core i7-12650H Processor with 24MB Cache, up to 4.7 GHz, 10 cores (6 P-cores and 4 E-cores) and 16GB of blisteringly fast 4800MHz DDR5 RAM on Windows 11",
    "SWIFT VISUALS – Stay one step ahead of the competition thanks to its 144Hz 15.6inches Full HD (1920 x 1080) IPS Type Display",
    "AMPLE STORAGE FOR ALL YOUR GAMES - Store all your game library, and load them fast on your 512GB PCIe NVMe M.2 SSD to take advantage of the full RTX gaming experience",
    "STAY COOL - Dual Self cleaning Arc Flow fans with anti-dust technology extend system longevity",
    "MILITARY GRADE TOUGHNESS - Durable MIL-STD-810H military standard lives in the TUF line as the devices are tested against drops, vibration, humidity and extreme temperatures to ensure reliability",
    "FULL CONNECTIVITY - Wi-Fi 6, Bluetooth 5.2, 1x Thunderbolt 4, 1x USB 3.2 Type-C (Gen2), 2x USB 3.2 Type-A (Gen1), 1x HDMI 2.0b, 1x 3.5mm Audio Jack, 1x LAN",
    "FUTUREPROOF - Easily add or replace memory and storage with its pop-open screw.",
    "Bundle: Get 30 days of Xbox Game Pass for PC with purchase (Active subscription required; continues until canceled; game catalog varies over time. Requires Windows 10/11)"],
    price: 1149.99,
    inventory: 10,
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/asus-laptop-2022.jpg"
  )

  # p14.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/asus-laptop-2022.jpg"),
  #   filename: "asus-2022"
  # })


  #15

  p15 = Product.create!(
    product_name: "Microsoft Surface Laptop Go 12.4 inches Touchscreen Laptop PC, Intel Quad-Core i5-1035G1, 4GB RAM, 64GB eMMC, Webcam, Win 10 Pro, Bluetooth, Online Class Ready - Platinum",
    description: "We sell computers with professional upgrade and customization. The manufacturer box will be opened by our engineers for customizing and testing. Defects & blemishes are significantly reduced by our in depth inspection & testing.",
    bullets: ["Intel Core i5 10th Gen 1035G1 (1.00GHz) 4 GB LPDDR4X Memory 64 GB eMMC",
    "Windows 10 Pro to bring you the powerful Windows features you use most at exceptional value.",
    "Make the most of every day with the sleek style, performance, and all-day battery life you need in our lightest Surface Laptop, all at an exceptional value.",
    "12.45 inches PixelSense (1536 x 1024) Touchscreen Display",
    "Ultra-light and portable, the apps you use every day, premium materials and a choice of must-have colours will make this your go-to laptop."],
    price: 264.95,
    inventory: 5,
    category_id: 1,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/microsoft-laptop.jpg"
  )

  # p15.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/microsoft-laptop.jpg"),
  #   filename: "microsoft-laptop"
  # })

  # 16

  p16 = Product.create!(
    product_name: "Mighty Patch Original from Hero Cosmetics - Hydrocolloid Acne Pimple Patch for Covering Zits and Blemishes, Spot Stickers for Face and Skin, Vegan-friendly and FSA Eligible (36 Count)",
    description: "Works best on whiteheads. Not suitable for cystic acne or blackheads. For external use only. Do not use on open wounds. Consult your doctor if you have sensitive skin or any known skin allergies. Do not use if allergic to pectin or rubber. Stop using and ask a doctor if a rash and/or irritation occurs. Keep out of reach of children. Please send us a message if you have any questions before usage.",
    bullets: ["The Original Award-Winning Acne Patch: Mighty Patch is a hydrocolloid sticker that improves the look of pimples overnight without the popping. Just stick it on, get some sleep, and wake up with clearer-looking skin.",
    "Results in 6-8 Hours: Absorbs pimple gunk thanks to our medical-grade hydrocolloid. Clinically tested, drug-free, and safe for all skin types.",
    "All-Night Adhesion: Strong enough to stay on through a whole night of tossing, turning, and pillow-squishing. Easy to remove in the AM without redness or irritation.",
    "Blends Seamlessly into Skin: The thin sticker with a translucent matte finish keeps your pimple under wraps day or night. You might just forget you’re even wearing it.",
    " Peace-Of-Mind Design: Our hydrocolloid patches are UV sterilized, and allergy tested. Each box comes with 36 medium dots (12 millimeters) on easy-peel perforated sheets."],
    price: 12.99,
    inventory: 99,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mighty-patches.jpg"
  )

  # p16.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mighty-patches.jpg"),
  #   filename: "mighty-patches"
  # })


  # 17
  
  p17 = Product.create!(
    product_name: "Paula's Choice Skin Perfecting 2% BHA Liquid Salicylic Acid Exfoliant, Gentle Facial Exfoliator for Blackheads, Large Pores, Wrinkles & Fine Lines, Travel Size, 1 Fluid Ounce - PACKAGING MAY VARY",
    description: "GENTLE NON-ABRASIVE LEAVE-ON",
    bullets: ["GENTLE NON-ABRASIVE LEAVE-ON EXFOLIANT: with 2% BHA (Beta hydroxy acid), to unclog & diminish enlarged pores, exfoliate dead skin cells, smooth wrinkles, and brighten and even out skin tone. Combats redness, wrinkles, aging, enlarged pores, and blackheads. PACKAGING MAY VARY.",
    "Dramatically improves skin's texture for radiant youthful even-toned skin. Beta hydroxy acid (BHA also known as salicylic acid) mimics the natural exfoliation process of younger skin by helping it shed extra layers while unclogging and clearing pores.",
    "HYDRATE, BRIGHTEN & SMOOTH FINE LINES: Our unique, non-abrasive, leave-on exfoliant is gentle enough for daily use on all skin types. Exfoliates dead skin cells while clearing pores for a more even tone, plus it visibly reduces fine lines & wrinkles.",
    "Paula's Choice facial exfoliants are gentler on delicate skin of the face & neck than an abrasive face scrub, which can cause micro-tears. A BHA leave-on exfoliator delivers hydration & can exfoliate directly inside the pore & improve how the pore works.",
    "Paula's Choice Skincare makes products that work. No fragrance, no parabens, no fluff. Just effective, science-backed formulas that target any concern from wrinkles to breakouts."],
    price: 13.00,
    inventory: 20,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/paulas-choice-exfoliant.jpg"
  )

  # p17.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/paulas-choice-exfoliant.jpg"),
  #   filename: "paula-exfoliant"
  # })


  # 18

  p18 = Product.create!(
    product_name: "COSRX Snail Mucin 96% Power Repairing Essence 3.38 fl.oz, 100ml, Hydrating Serum for Face with Snail Secretion Filtrate for Dark Spots and Fine Lines, Not Tested on Animals, No Parabens, No Sulfates, No Phthalates, Korean Skincare",
    description: "#12 in Beauty & Personal Care",
    bullets: ["The Real Snail Essence: Formulated with 96.3% Snail Secretion Filtrate, this essence repairs and rejuvenates the skin from dryness and aging. It improves skin vitality by reducing dullness and soothing dehydrated skin.",
    "Simple Yet Effective Light-weight Essence: A lightweight essence which fastly absorbs into the skin and gives you a natural and healthy glow. Guarantees long-lasting hydration without heavy feeling on the skin.",
    "Key Ingredient: Snail Secretion Filtrate contains 'Mucin'- an EFFECTIVE ingredient for enhanced moisturization. It instantly soothes damaged skin and delivers moisture deep into your skin. Perfect for dehydrated and damaged skin.",
    "NO Snails are Harmed: Snail Mucin is obtained in a safe and environmentally friendly way in a favorite environment of snails and then processed as a cosmetic material. 100% Natural, Hypoallergenic, Dermatologist-tested.",
    "COSRX Standards: All COSRX products are formulated with skin-friendly ingredients that alleviate irritated skin. Hypoallergenic, Dermatologist tested, Animal Testing-FREE, Parabens-FREE, Sulfates-FREE, Phthalates-FREE. Please inform that the expiration date on the product is written in the South Korean format, which goes by Year/ Month/ Date (YY.MM.DD)"],
    price: 19.95,
    inventory: 5,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/snail-mucin-essence.jpg"
  )

  # p18.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/snail-mucin-essence.jpg"),
  #   filename: "snail-mucin"
  # })


  # 19
  p19 = Product.create!(
    product_name: "Celavi Essence Facial Sheet Face Mask Variety Set Classic Authentic Korean Moisturizing Skincare (12-Packs)",
    description: "Keep your face clean and clear while reversing the signs of aging, balancing your natural skin tone, and infusing it with essential hydration with Celavi Face Mask Sheets infused with powerful antioxidants, natural botanicals, and vital nutrients that nourish and protect your skin while leaving behind beautiful radiance.",
    bullets: ["12 Essence Set Includes - Collagen, Seaweed, Honey, pomegranate, Aloe Vera, Vitamin C, Acai Berry, Tea Tree, Avocado, Ginseng, Cucumber, Charcoal",
    "Made In Korea, Paraben Free, Oil Free, Sulfate Free, Cruelty-Free",
    "A deeply-hydrating, revitalizing skin therapy helps create firmer, healthier, more balanced skin",
    "For dry, oily, or sensitive skin"],
    price: 9.99,
    inventory: 0,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/celavi-face-mask.jpg"
  )

  # p19.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/celavi-face-mask.jpg"),
  #   filename: "celavi-mask"
  # })


  #20
  p20 = Product.create!(
    product_name: "Dr. Pure Ice Roller for Face Massage, Face Roller for Reduce Puffiness Anti Wrinkle Migraine Pain Relief Tighten Skin, Face Icing Massager Cooling Facial Roller, Women Gifts Skin Care Tool",
    description: "Enjoy a home facial spa with face icer.

Face roller massager helps relax your facial muscles, stimulate blood circulation and natural collagen production.

Cold face roller can be used with any skin care product and is suitable for all skin types.

You can use your ice roller both morning and evening. It is great for helping the product absorb into the skin, allowing you to feel less stressed and relaxed, reducing redness and puffiness.",
    bullets: ["Instant Face Lift: The most immediate effect of this ice roller is to reduce puffiness and redness. Face roller massager helps increase flow, drain fluids, depuff your face and promote skin circulation. Your facial contour will be lifted and your jawline will be tightened",
    "Anti-aging Skincare Tool: Cold therapy of the facial roller leaves skin look tighter and makes the overall appearance is fresher and brighter. Use regularly every day to boost face circulation and help reduce wrinkles and other signs of aging, reduce the appearance of fine lines and revitalizes skin. Gives your skin a natural & healthy glow",
    "Keep Skin Healthy: In addition to slow age, This facial massager are beneficial for your face and body. Facial ice roller soothes sunburn, reduces oily skin, relieves acne, shrinks pores and reduces inflammation, helps your skin absorb products. It's great for relieving aches & muscle soreness anywhere on your body, as well as migraines",
  "At Home Beauty Tool: The face ice roller stay cool long after it has been taken out of the freezer, with no water or ice leaks. It's compact, lightweight, and easy to use - simply glide it across your skin to depuff, calm, and tighten. You can use it as part of your everyday skincare routine or as part of an at-home beauty treatment",
"Self-care Gift: The ice roller for face does a great job at reducing buildup fluid and toning the skin. You can use it as a morning wake-up call and it's an amazing pick-me-up to get your day started. The face sculpting tool a perfect gift choice to give to yourself or to friends"],
    price: 8.49,
    inventory: 35,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ice-roller.jpg"
  )

  # p20.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ice-roller.jpg"),
  #   filename: "ice-roller"
  # })



  # 21
  p21 = Product.create!(
    product_name: "CeraVe Moisturizing Cream | Body and Face Moisturizer for Dry Skin | Body Cream with Hyaluronic Acid and Ceramides | Normal | Fragrance Free | 19 Oz | Packages May Vary",
    description: "Developed with dermatologists, CeraVe Moisturizing Cream has a unique formula that provides 24-hour hydration and helps restore the protective skin barrier with three essential ceramides (1,3,6-II) and hyaluronic acid. This rich, non-greasy, fast-absorbing formula is ideal for sensitive skin on both the face and body  Featuring our patented MVE Technology to release a steady stream of moisturizing ingredients throughout the day and night.",
    bullets: ["[ HYALURONIC ACID MOISTURIZER ] With hyaluronic acid, ceramides and MVE technology for 24 hour hydration. Rich, velvety texture that leaves skin feeling smooth, it is absorbed quickly for softened skin without greasy, sticky, feel.",
    "[ ESSENTIAL CERAMIDES ] Ceramides are found naturally in the skin and make up 50% of the lipids in the skin barrier. All CeraVe products are formulated with three essential ceramides (1, 3, 6-II) to help restore and maintain the skin’s natural barrier.",
    "[ DRY SKIN RELIEF ] A deficiency of ceramides in skin can often be associated with dry skin, which can feel itchy and look flaky. CeraVe Moisturizing Cream was shown to increase the skin's level of ceramides after 4 weeks.",
    "[ DERMATOLOGIST RECOMMENDED ] CeraVe Skincare is developed with dermatologists and has products suitable for dry skin, sensitive skin, oily skin, acne-prone, and more. This skin care product comes with a lid seal",
    "[ GENTLE DAILY MOISTURIZER ] For face and body or can be used as a hand cream for dry skin relief. Holds National Eczema Association (NEA) Seal of Acceptance. Fragrance free, paraben free, allergy-tested, and non-comedogenic."],
    price: 15.48,
    inventory: 99,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cerave-cream.jpg"
  )

  # p21.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cerave-cream.jpg"),
  #   filename: "cerave-moisturizing-cream"
  # })



  #22
  p22 = Product.create!(
    product_name: "Neutrogena Ultra Sheer Dry-Touch Water Resistant and Non-Greasy Sunscreen Lotion with Broad Spectrum SPF 70, 3 Fl Oz (Pack of 1)",
    description: "Neutrogena Ultra Sheer Dry-Touch Sunscreen SPF 70 with Helioplex technology helps prevent damaging UVA rays from penetrating deep under skin's surface.",
    bullets: ["3-fluid ounce bottles of Neutrogena Ultra Sheer Dry-Touch Non-Greasy Sunscreen with SPF 70 that helps defend against the signs of sun and decrease the risk of skin cancer when used as directed",
    "This lightweight sunscreen is fast-absorbing with Dry-Touch technology for a non-greasy, matte finish and is formulated with Helioplex for superior sun protection for your skin",
    "From the dermatologist-recommended suncare brand, this sunscreen is also available in both spray and stick form and can be used at the pool or in the ocean for up to 80 minutes of water-resistance",
    "Sunscreen lotion formula uses Avobenzone for optimal broad-spectrum protection from skin-aging UVA rays and skin-burning UVB rays for both your body and face",
    "Both PABA-free and non-comedogenic, this lightweight sunscreen is suitable for all skin types and provides powerful face and body sun protection without the heavy finish"],
    price: 8.97,
    inventory: 99,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/neutragena-sunscreen.jpg"
  )

  # p22.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/neutragena-sunscreen.jpg"),
  #   filename: "neutrogena-sunscreen"
  # })


  #23

  p23 = Product.create!(
    product_name: "Seraphic Skincare Korean Exfoliating Mitts (2pcs) Microdermabrasion at Home Exfoliating Gloves Visibly Lift Away Dead Skin, Great for Spray Tan Removal or Keratosis Pilaris, Made of 100% Viscose Fiber",
    description: "#156 in Beauty & Personal Care",
    bullets: ["Shower Exfoliator for Home Use - Experience Korean spa treatment at home. Our body-exfoliating scrub mitts provide full microdermabrasion to visibly lift away dead skin. Packaging may vary.",
    "Love the Way Your Skin Feels - Our shower mitts give you the smoothest skin ever. When you use our exfoliating body scrubbers 2-4x a month, you’ll enjoy better product absorption, fewer bumps and ingrown hairs, and increased circulation.",
    "Use as a Self-tan Remover - The 100% viscose construction of this microdermabrasion mitt makes it great for buffing out your self tanner without being too harsh. You can also use it to prep your skin before applying tanner.",
    "Way Better than Loofahs or Chemical Exfoliants - Loofahs and chemical exfoliants don’t have the skin-gripping power of our viscose shower exfoliators, meaning they’re not as good at removing dead skin. Our mitts are rough enough to exfoliate deep, while soft enough to buff and smooth.",
    "Reveal a Heavenly Glow - Use our Korean scrub mitts to fight back against dry, bumpy skin caused by keratosis pilaris. Your arms, legs, and body will look smoother and fresher than ever before."],
    price: 9.99,
    inventory: 99,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/seraphic-exfoliating-mitts.jpg"
  )

  # p23.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/seraphic-exfoliating-mitts.jpg"),
  #   filename: "seraphic-exfoliating-mitts"
  # })


  #24

  p24 = Product.create!(
    product_name: "First Aid Beauty KP Bump Eraser Body Scrub Exfoliant for Keratosis Pilaris with 10% AHA 2 oz.",
    description: "#184 in Beauty & Personal Care",
    bullets: ["Exfoliating Body Scrub: Made with chemical and physical exfoliators that sweep away dry, rough bumps to reveal healthier looking skin that feels exceptionally smooth",
    "Reduce Skin Bumps Quickly: Whether you call it “strawberry skin” or “chicken skin,” either way call it gone with this fast-acting KP body scrub that delivers the benefits of a chemical peel and microdermabrasion treatment in one",
    "Buff Away Dead Skin: Glycolic and Lactic Acids at a combined level of 10% help loosen skin’s top layer and decongest pores, while Pumice Buffing Beads (NOT microplastic!) whisk it all away",
    "Free From: Drying Alcohols, Artificial Colorants, Artificial Fragrance, Lanolin, Mineral Oil, Parabens, Petrolatum, Phthalates, Propylene Glycol, Sulfates, Talc, Formaldehydes, Oxybenzone, Coal Tar, Triclocarbon, Ethanol",
    "Dermatologist Tested: Our vegan & cruelty-free exfoliating body scrub is also gluten-free, nut-free, oil-free, soy-free, silicone-free, safe for sensitive skin and nano-free"],
    price: 12.00,
    inventory: 99,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/first-aid-exfoliant.jpg"
  )

  # p24.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/first-aid-exfoliant.jpg"),
  #   filename: "first-aid-exfoliant"
  # })


  #25

  p25 = Product.create!(
    product_name: "Anastasia Beverly Hills - Eyeshadow Palette - Soft Glam",
    description: "Anastasia Beverly Hills Soft Glam Eye Shadow Palette is an essential neutral palette, with 14 shades ranging from warm and cool mattes to glamorous shimmers. Each shade features ABH’s highly pigmented, easy-to-blend formula so you can create seamless neutral eye looks for both day and night.",
    bullets: ["An essential neutral palette that will take you from day to night, featuring 14 shades ranging from warm and cool mattes to glamorous shimmers.",
    "Palette includes 9 ultra-matte and 5 metallic finishes",
    "The full-pigment formula delivers high color payoff and buildable intensity",
    "Includes a dual-ended brush and a large mirror housed inside travel-friendly packaging"],
    price: 45.00,
    inventory: 120,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/soft-glam-eyeshadow.jpg"
  )

  # p25.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/soft-glam-eyeshadow.jpg"),
  #   filename: "soft-glam-eyeshadow"
  # })


  #26
  p26 = Product.create!(
    product_name: "NYX PROFESSIONAL MAKEUP Ultimate Shadow Palette, Eyeshadow Palette - Ultimate Queen",
    description: "We named this collection the Ultimate Shadow Palette because that's exactly what it is-a pro-level palette packed with 16 high-performance eyeshadows and pressed pigments in a rainbow of inspired shades. Available in various striking color combinations - Ultimate Queen, Cool or Warm Neutrals, Bright and Smokey/Highlight - each set features a vivid mix of velvety-rich textures and mesmerizing finishes that range from mattes and satins to shimmers and metallics. .",
    bullets: ["Eyeshadow Palette: This ultimate makeup palette features 16 highly pigmented shadows that glide onto lids and make eyes pop with color; Use with NYX Professional Makeup eyeshadow primer for bolder, longer lasting color",
    "Ultimate Eye Shadow: Each high quality eyeshadow palette features a highly pigmented mix of finishes from matte and satin to shimmery and metallic; perfect for your skin tone; Apply primer and build your look",
    "All Eyes On Eye Makeup: Complete your look with our full range of eye makeup products ranging from eyeshadow palettes to false eyelashes, eyeliners, concealers, setting sprays, eyebrow makeup, eyeshadow primer and more",
    "Cruelty Free Cosmetics: We believe animals belong in our arms, not in a lab; All of our makeup is certified and acknowledged by PETA as a cruelty free brand; We don't test any of our products on animals",
    "Discover NYX Professional Makeup: Try all of our professional makeup products today from eyeshadow, eyeliner, and false lashes to liquid lipstick, lip gloss, primer, concealer, setting sprays and eyebrow makeup"],
    price: 18.00,
    inventory: 0,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nyx-ultimate-queen-eyeshadow.jpg"
  )

  # p26.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nyx-ultimate-queen-eyeshadow.jpg"),
  #   filename: "nyx-ultimate-queen-eyeshadow"
  # })


  #27
  p27 = Product.create!(
    product_name: "Wet n Wild MegaGlo Contour Palette, Dulce De Leche | Contouring Powder Face Kit | Flawlessly Sculpted Face",
    description: 'Duo that gives you flawless skin',
    bullets: ["This duo of perfectly complementary contouring powders delivers a flawlessly sculpted face in no time flat",
    "The deeper color defines while the lighter color highlights your best features",
    "This duo of perfectly complementary contouring powders delivers a flawlessly sculpted face in no time flat. The deeper color defines while the lighter color highlights your best features, leaving you at your nofilter best, whatever the occasion."],
    price: 4.28,
    inventory: 20,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/wet-n-wild-contouring.jpg"
  )

  # p27.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/wet-n-wild-contouring.jpg"),
  #   filename: "wet-n-wild-contouring"
  # })


  #28
  p28 = Product.create!(
    product_name: "Mielle Organics Rosemary Mint Scalp & Hair Strengthening Oil With Biotin & Essential Oils, Nourishing Treatment for Split Ends and Dry Scalp for All Hair Types, 2-Fluid Ounces",
    description: "#4 in Beauty & Personal Care",
    bullets: ["NOURISH & STRENGTHEN: Our nutrient-rich, biotin-infused treatment can be used as part of your everyday hair care routine or as an intensive deep treatment to prevent damage for strong, lustrous hair with a fresh, invigorating scent",
    "SMOOTH SPLIT ENDS: This lightweight treatment nourishes split ends and hair follicles for a sleek look; Apply to the ends of hair before you shampoo to soothe and smooth for a healthy, shiny finish that can be air-dried or styled as desired",
    "SOOTHE DRY SCALP: This rich blend of over 30 essential oils and nutrients deeply penetrates the scalp to increase circulation, combat dandruff, and comfort itchy, sensitive skin while working to strengthen, lengthen, nourish, and protect hair",
    "SAFE FOR ALL HAIR TYPES: Our versatile Rosemary Mint Scalp & Hair Strengthening Oil promotes radiant hair for all hair types and deeply nourishes types 3A to 4C, chemically-treated hair, braids, weaves, and both low and high porosity level hair",
    "BY WOMEN FOR WOMEN: Mielle Organics aims to empower women of all hair types and styles with powerful products and gentle, organic ingredients that amplify your natural beauty and are the “root to results” that leave you looking and feeling your best"],
    price: 9.99,
    inventory: 200,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mielle-hair.jpg"
  )

  # p28.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mielle-hair.jpg"),
  #   filename: "mielle-hair"
  # })



  #29
  p29 = Product.create!(
    product_name: "ORIGINAL Mimi and Co Spa Headband - Sponge & Terry Towel Cloth Fabric Head Band for Skincare, Face Washing, Makeup Removal, Shower, Facial Mask - Hair Accessories, Padded Headband, Croissant Headband",
    description: "ORIGINAL Mimi and Co Spa Headband - Sponge & Terry Towel Cloth Fabric Head Band for Skincare, Face Washing, Makeup Removal, Shower, Facial Mask - Hair Accessories, Padded Headband, Croissant Headband",
    bullets: ["Extra Absorbent - Thanks to their sponge-covered terry cloth make, these skincare headbands are highly absorbent and can soak up moisture as you wash your face or apply your skincare creams and serums.",
    "One Size Fits All - Size doesn’t matter when it comes to our head bands. Each face washing headband is highly flexible and stretchable so it can be worn by almost anyone - men and women alike!",
    "Adorable Design - Look cute even while washing your face! Aside from making your skincare routine easier, this self care headband sports a charming baby pink color and an easy-to-wear design",
    "A Versatile Hair Band - Wearing this while washing your face is just one way of using it. It may also come in handy for absorbing sweat during yoga or keeping your hair in place while applying makeup.",
    "A Great Self Care Gift - Looking to prepare a self care package for a friend or loved one? Make sure you include this sponge face wash headband! It'll make an great present on any special occasion"],
    price: 6.99,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mimi-headband.jpg"
  )

  # p29.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mimi-headband.jpg"),
  #   filename: "mimi-headband"
  # })



  #30
  p30 = Product.create!(
    product_name: "100 Pcs Thick Seamless Brown Hair Ties, Ponytail Holders Hair Accessories No Damage for Thick Hair (Natural Colors)",
    description: "Our seamless hair ties are fit for different kinds of outfits and hair types, they are simple and fashion, you can use them on any occasion.

They are suitable for men, women, kids and the people who have thick heavy hair. It’s soft to pull on and off , and will not damage to your hair.",
    bullets: ["【DURABLE AND STRETCHY】Made of high elastic thick material, the hair bands are soft and stretchy which can hold your hair without damage. These women hair ties can also keep your hair firmly and not easy to loose up.",
    "【NATURAL COLOR】5 neutral colors can easily match different hair colors, also can match all your dressing and hairstyles. 100 pcs 5 colors hair ties are economical to use for a long time. Suitable for ponytail holder for daily use and workout.",
    "【NO HAIR DAMAGE】With seamless design and soft material, the women hair bands are gentle enough to use and remove, will not snag or pull your hair. These hair ties can be stretched up to 9.8 inches but will not be stretched out easily, which is great elasticity and good for thick hair.",
    "【WIDELY USED】The 100pcs brown hair ties with 1.5 inch diameter make it great for thin hair, thick hair, straight hair, heavy hair and curly hair, easy to form beautiful low or high ponytails, elegant and stylish to perfectly match all kinds of outfits or hairstyles.",
    "【Great for Kids and Women】The brown hair ties are simple but practical, they can hold your ponytail well for your daily use. They can be applied in various occasions such as school, home, office or using them when you are working out."],
    price: 5.94,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hairties.jpg"
  )

  # p30.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hairties.jpg"),
  #   filename: "hairties"
  # })


  #31

  p31 = Product.create!(
    product_name: "Maybelline Instant Age Rewind Eraser Dark Circles Treatment Multi-Use Concealer, 110, 1 Count (Packaging May Vary)",
    description: "This dark circle eraser concealer instantly creates a radiant, refreshed looking eye area. Infused with goji berry and Haloxyl. Packaging may vary, what you receive may not be what is reflected on site. â€¢ Instantly erases the appearance of dark circles and fine lines â€¢ Under eye concealer visibly diminishes the appearance of puffiness â€¢ Eye area looks radiant and refreshed â€¢ Anti-aging dark circle treatment contains goji berry and haloxyl to help erase appearance of dark circles and fine lines Step 1. Twist collar of the applicator until the concealer is visible on the sponge (may take some turns on first use). Step 2. Apply concealer to the under-eye area and blend. Step 3. For extreme dark circles, apply the Neutralizer under concealer. Step 4. To add luminosity, apply the Brightener to the inner corner of eyes, cheek, brow bones and bridge of the nose. The Dark Circles Eraser is protected by an anti-microbial system. Do not wet applicator. Wipe off excess eye concealer with dry tissue. By MAYBELLINE.",
    bullets: ["Maybelline Instant Age Rewind Concealer: America's Number 1 Concealer; Erase the look of dark circles, correct the appearance of redness and brighten the look of dull skin with Instant Age Rewind Eraser multi-use concealer",
    "Anti-Aging Concealer: Turn back time with this anti-aging under eye treatment concealer infused with Haloxyl; Say bye bye to the look of fine lines, blemishes, redness, and dark circles, and hello to a radiant, well rested, refreshed looking eye area",
    "Best Face Forward: Maybelline has sheer, medium, and full coverage foundation in liquid, stick, and cushion foundation formulas, and a range of concealers, plus face primers, contour, highlighter, and pressed powder to help you create a perfect canvas",
    "Maybelline Has What You Need: To create any look foundation, BB creams, concealers, and highlighters for the perfect canvas, eye shadows, brow pencils, and eyeliners for any eye look and lip products, from showstopping matte lipstick to a natural lip balm",
    "Remove Maybelline Makeup With Micellar Water: Use Garnier Micellar Water as a gentle makeup remover at night, and as a facial cleanser in the morning to prep skin for Maybelline makeup"],
    price: 8.80,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/maybellione-rewind.jpg"
  )

  # p31.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/maybellione-rewind.jpg"),
  #   filename: "maybelline-rewind"
  # })


  #32
  p32 = Product.create!(
    product_name: "e.l.f. Poreless Putty Primer, Silky, Skin-Perfecting, Lightweight, Long Lasting, Smooths, Hydrates, Minimizes Pores, Flawless Base, All-Day Wear, Flawless Finish, Ideal for All Skin Types, 0.74 Fl Oz",
    description: "#116 in Beauty & Personal Care",
    bullets: ["Infused with Squalane for optimal hydration, perfect for all skin types.",
    "Velvety texture glides effortlessly over the skin, smoothing over imperfections for a poreless effect and the ultimate grip on your makeup.",
    "Apply a thin, even amount to moisturized skin prior to makeup application and allow to set for 30 seconds before applying foundation.",
    "Easy to carry and convenient for travel.",
    "Cruelty-free, vegan and 100% free from Phthalates, Parabens, Nonylphenol, Ethoxylates, Triclosan, triclocarban."],
    price: 9.99,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/elf-primer.jpg"
  )

  # p32.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/elf-primer.jpg"),
  #   filename: "elf-primer"
  # })


  #33
  p33 = Product.create!(
    product_name: "e.l.f. Flawless Finish Foundation, Improves Uneven Skin Tone, Lightweight, Medium Coverage & Semi-Matte, Vegan & Cruelty-Free, Buff, 0.68 Fl Oz",
    description: "e.l.f. Flawless Finish Foundation, Improves Uneven Skin Tone, Lightweight, Medium Coverage & Semi-Matte, Vegan & Cruelty-Free, Buff, 0.68 Fl Oz",
    bullets: ["RESTORE & ILLUMINATE: e.l.f. Flawless Finish Foundation is a lightweight liquid foundation that naturally blends into skin (and hydrates while you’re at it) to help improve uneven skin tone and texture. The shade Buff is light with peachy undertones.",
    "ALL-DAY WEAR: This highly blendable and buildable formula goes on smooth as silk, providing medium-to-full coverage and weightless all-day wear. Added perks: it’s oil-free and supercharged with glycerin to hydrate and soften your skin.",
    "SEMI-MATTE FINISH: This oil-free foundation blends into skin for a beautiful semi-matte satin finish that lasts all day long and is perfect for all skin-types.",
    "MORE COVERAGE, MORE GLOW: For sheer coverage mix our Daily Hydration Moisturizer with the foundation, or for added glow, mix our Beautifully Bare Natural Glow Lotion with the foundation.",
    "SKIN-LOVING INGREDIENTS: All e.l.f. products are made from skin-loving ingredients you want, minus the toxins you don’t—all at good-for-you prices. All e.l.f. products are 100% cruelty-free and Vegan."],
    price: 6.00,
    inventory: 100,
    category_id: 2, 
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/elf-foundation.jpg"
  )

  # p33.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/elf-foundation.jpg"),
  #   filename: "elf-foundation"
  # })


  #34
  p34 = Product.create!(
    product_name: "Physicians Formula Murumuru Butter Bronzer | Bronzer Face Powder Makeup | Dermatologist Approved",
    description: "Ultra-luxurious bronzer, infused with Murumuru Butter, delivers a radiant Brazilian goddess glow. Moisturizing wonder features ultra-refined pearl and soft-focus pigments that smooth skin texture, brighten skin tone and deliver a gorgeous bronze finish. May Contain: Iron Oxides, Red 7 Lake, Titanium Dioxide.",
    bullets: ["WARM ISLAND GLOW - Give your face the radiant goddess glow of the tropics Pick your color and watch your look gently transform as the refined pearls and soft-focus pigments smooth and brighten your skin tone with a subtle shimmer finish",
    "NOURISHING AND MOISTURIZING - Made with a blend of murumuru butter, cupuaçu butter, and tucuma butter from the nutrient-rich Amazon, this makeup is packed with essential fatty acids and pro-vitamins that soften, condition, and moisturize the skin",
    "SMOOTH APPLICATION - Whether you use a makeup brush or even just your fingers, cosmetics from the Murumuru Butter Collection glide on with ease and seamlessly blend into the skin for attractive all-day coverage. Product Form: Pressed Powder",
    "MADE FOR SENSITIVE SKIN - Physicians Formula makeup is specifically formulated with your health and comfort in mind That's why we use high-quality hypoallergenic and natural ingredients, leaving you looking and feeling beautiful from the inside out",
    "CRUELTY-FREE – All Physicians Formula foundations, eye makeup, lipsticks, and other cosmetics are always cruelty-free and never test on animals"],
    price: 10.12,
    inventory: 30,
    category_id: 2, 
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/physician-bronzer.jpg"
  )

  # p34.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/physician-bronzer.jpg"),
  #   filename: "physicians-bronzer"
  # })



  #35
  p35 = Product.create!(
    product_name: "NYX PROFESSIONAL MAKEUP Slim Lip Pencil, Long-Lasting Creamy Lip Liner - Peakaboo Neutral",
    description: "NYX PROFESSIONAL MAKEUP Slim Lip Pencil, Long-Lasting Creamy Lip Liner - Peakaboo Neutral",
    bullets: ["Lip Liner In All Shades: NYX Professional Makeup Slim Lip Pencil natural lip liner pencils come in a variety of dashing shades from auburn to orange and traffic stopping red to line and define your lips",
    "Long Wearing Lip Liner Pencil: This buttery soft, long wearing lip pencil formula goes on easily and resists bleeding; Glide it on for an instant pump to your pout accompanying your favorite NYX Professional Makeup lipsticks and lip glosses",
    "Lip Products for the Perfect Pout: Doll your lips in creamy, long lasting perfection; Try our complete line of lip makeup including liquid lipstick, lip gloss, lip cream, lip liner and butter gloss",
    "Cruelty Free Cosmetics: We believe animals belong in our arms, not in a lab; All of our makeup is certified and acknowledged by PETA as a cruelty free brand; We don't test any of our products on animals",
    "Discover NYX Professional Makeup: Try all of our professional makeup products today from eyeshadow, eyeliner, and false lashes to liquid lipstick, lip gloss, primer, concealer, setting sprays and eyebrow makeup"],
    price: 4.96,
    inventory: 20,
    category_id: 2, 
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nyx-pencil.jpg"
  )

  # p35.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nyx-pencil.jpg"),
  #   filename: "nyx-pencil"
  # })


  #36
  p36 = Product.create!(
    product_name: "Peripera Ink the Velvet Lip Tint | High Pigment Color, Longwear, Weightless, Not Animal Tested, Gluten-Free, Paraben-Free | #017 ROSY NUDE, 0.14 fl oz",
    description: "#329 in Beauty & Personal Care",
    bullets: ["[STAY ALL DAY - BOLD AND LONG LASTING COLORS] Stay a bold lip with our Ink the Velvet Tint! Our tints use a breakthrough formula with high intensity color pigments that naturally stain your lips. The color goes on smooth and will last throughout the day.",
    "[VELVETY SMOOTH FORMULA] We use an adhesive formula with a double layer elastomer that fills in the fine curves of your lips so you can get that emollient and silky finish.",
    "[WEIGHTLESS AND FRESH FINISH] A lightweight layer of color on your lips helps you get through the day without having your lips feel sticky or clumpy. Comfort is key!",
    "[APPLICATOR TIP] Designed with a precision applicator to shape and line your lips for a precise and perfectly applied lip.",
    "[FUN AND FLIRTY COLORS] A collection of colors that fits every complexion. Find your signature color from our wide selection of gorgeous shades!"],
    price: 9.85,
    inventory: 15,
    category_id: 2, 
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/peripera-ink-velet-rosy-nude.jpg"
  )

  # p36.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/peripera-ink-velet-rosy-nude.jpg"),
  #   filename: "peripera-lip"
  # })


  #37

  p37 = Product.create!(
    product_name: "[Beauty of Joseon] Relief Sun (50ml, 1.69fl.oz)",
    description: "Relief sun is a chemical sunscreen that helps protect your skin from ultraviolet rays.

It has a light moisturizing cream texture, so it doesn't rub off on makeup and there is no white cast.",
    bullets: ["[organic suncreen] Relief Sun is an organic suncreen that applies gently on the skin and by also including skin calming ingredients, it allows sensitive skin types to use it sith ease as well.",
    "[UV Protection] SPF50+ PA++++ broad specturm approved by separate labs in South Korea and Spain.",
    "[Rice Bran Water] During the Joseon Dynasty, rice bran water was called ‘miansu,’ which signifies water that beautifies the skin, and was used like today's toner.",
    "[Moist daily sunscreen] It absorbs ultraviolet rays into the skin, converts them into harmless heat after chemical reactions with UV energy, and then disappears, so it is moist and has natural application even after applying it several times.",
    "1. It was produced in a safe manufacturing facility certified by GMP. 2. All product booking boxes are manufactured using FSC-certified paper. 3. This product is cruelty-free and is against animal experiments. 4. We did not use artificial fragrance and colorants, essential oil, mineral oil, etc., that may irritate sensitive skin."],
    price: 17.95,
    inventory: 1,
    category_id: 2, 
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/joseon-sunscreen.jpg"
  )

  # p37.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/joseon-sunscreen.jpg"),
  #   filename: "joseon-sunscreen"
  # })


  #38
  p38 = Product.create!(
    product_name: "Aveeno Protect + Hydrate Moisturizing Body Sunscreen Lotion With Broad Spectrum Spf 60 & Prebiotic Oat, Weightless, Paraben-free, Oil-free & Oxybenzone-free, Pump Bottle, 12.0 ounces",
    description: "Moisturize and protect your skin from the sun with Aveeno Protect + Hydrate body sunscreen lotion. From Aveeno, A dermatologist-recommended brand for over 65 years, This weightless sunscreen lotion contains SPF 60 to protect from harmful UVA and UVB rays and combat sun-induced free radicals that accelerate skin aging. Made with nourishing prebiotic oat, the daily sunscreen deeply hydrates skin all day, leaving it feeling soft and moisturized. And, when used as directed along with other skin protection measures, the hydrating sunscreen helps prevent sunburn and decreases the risk of skin cancer. The non-greasy, hypoallergenic formula dries clear, so it won't stain skin. It's also Paraben-, phthalate-, oil-, Oxybenzone-, and dye-free. Water- and sweat-resistant for up to 80 minutes, The moisturizing SPF 60 sunscreen lotion is perfect for outdoor activities. For best results, apply the sunblock 15 minutes before sun exposure and reapply every two hours or more often as needed.",
    bullets: ["12-Fluid Ounce pump bottle of Aveeno Protect + hydrate sunscreen Broad Spectrum SPF 60 Body lotion to help protect and provide all-day hydration to skin",
    "Made with nourishing prebiotic oat, this lightweight daily sunscreen helps leave skin feeling soft and moisturized all day as it combats sun induced free radicals that accelerate skin-aging",
    "With a refreshing and weightless formula and a non-greasy feel, the invisible sunscreen lotion also provides broad spectrum SPF 60 protection from harmful UVA and UVB rays",
    "This hypoallergenic sunscreen is paraben-free, phthalate-free, oil-free, Oxybenzone-free, dye-free and is water and sweat-resistant for up to 80 minutes, making it great to use during Outdoor activities",
    "From a Dermatologist-recommended brand for over 65 years, Aveeno Protect + hydrate body sunscreen helps prevent sunburn And decreases the risk of skin cancer and Early aging caused by the sun when used as directed with other sun protection measures"],
    price: 25.95,
    inventory: 0,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/aveno-sunscreen.jpg"
  )

  # p38.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/aveno-sunscreen.jpg"),
  #   filename: "aveeno-sunscreen"
  # })



  #39
  p39 = Product.create!(
    product_name: "Ariana Grande Cloud Eau de Parfum Spray ,clear ,3.4 Fl oz",
    description: "Ariana Grande fragrance cloud is the uplifting new scent that imbues a thoughtful, artistic expression of positivity and happiness from Ariana to her fans. This addictive scent opens with a dreamy blend of alluring lavender blossom, forbidden juicy Pear and mouth-watering bergamot. The heart of the fragrance is a whipped touch of creme de coconut, indulgent praline and exotic, vanilla orchid. Sensual musk's and creamy woods add cashmere like feel that seduces the senses.",
    bullets: ["Ariana Grande fragrance Cloud is the uplifting new scent that imbues a thoughtful, artistic expression of positivity and happiness from Ariana to her fans.",
    "This addictive scent opens with a dreamy blend of alluring lavender blossom, forbidden juicy Pear and mouth-watering bergamot.",
    "The heart of the fragrance is a whipped touch of creme de coconut, indulgent praline and exotic, vanilla orchid. Sensual musk's and creamy woods add cashmere like feel that seduces the senses.",
    "Top: lavender blossom juicy Pear bergamot",
    "Heart: creme de coconut indulgent praline vanilla orchid",
    "Dry down: sensual musk's creamy blond woods",
    "Note: Apply to pulse points: wrist, chest and neck."],
    price: 65.00,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ariana-cloud.jpg"
  )

  # p39.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ariana-cloud.jpg"),
  #   filename: "ariana-cloud"
  # })  


  #40
  p40 = Product.create!(
    product_name: "Women's Daisy by Marc Jacobs Eau So Fresh Eau De Toilette Spray, 4.2 Fl Oz",
    description: "Daisy Eau So Fresh by Marc Jacobs for Women Eau De Toilette Spray 4.25 Oz / 125 Ml.",
    bullets: ["Marc Jacobs Daisy Eau So Fresh Eau De Toilette Spray - 125ml/4.25oz",
    "Incredibly fresh & irresistible fragrance for women",
    "Sweet, elegant, sophisticated, feminine & sensual",
    "Perfume begins with fruity notes of grapefruit, raspberry & pear",
    "The heart is enhanced with floral notes of violet, rose, apple blossom & jasmine"],
    price: 72.99,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/daisy.jpg"
  )

  # p40.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/daisy.jpg"),
  #   filename: "daisy-perfume"
  # })  


  #41
  p41 = Product.create!(
    product_name: "Kenzo FlowerbyKenzo 3.4 oz Eau de Parfum Spray",
    description: "Flower by Kenzo for Women - 3.4 oz EDP Spray",
    bullets: ["EDP Spray", "3.4 oz - Retail", 
      "Introduced in the year 2000, by the design house of Kenzo. Flower is a floral, powdery fragrance with a blend of wild hawthorne, bulgarian rose, parma violet, cassia, hedione, cyclosal, opoponax, white musk and vanilla. It is recommended for casual wear",
    "Ships same day.", "International Shipping Available"],
    price: 66.92,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kenzo.jpg"
  )

  # p41.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kenzo.jpg"),
  #   filename: "kenzo-flower"
  # })   


  #42
  p42 = Product.create!(
    product_name: "NYX PROFESSIONAL MAKEUP Butter Gloss, Non-Sticky Lip Gloss - Creme Brulee (Natural)",
    description: "Buttery soft and silky smooth, our decadent Butter Gloss is now available in sumptuous shades! Each glossy color delivers sheer to medium coverage that melts onto your lips and is never sticky, leaving your lips soft, supple and kissable.",
    bullets: ["Butter Gloss: Buttery soft and silky smooth, our decadent Butter Gloss is available in a wide variety of sumptuous shades; Each glossy color delivers sheer to medium coverage that melts onto your lips",
    "Kissable Lips: Our best selling Butter Gloss goes on smooth and creamy and is never sticky, leaving your lips soft, supple and kissable; Try all of our delicious shades, from Angel Food Cake to Tiramisu",
    "Lip Products for the Perfect Pout: Doll your lips in creamy, long lasting perfection; Try our complete line of lip makeup including liquid lipstick, lip gloss, lip cream, lip liner and butter gloss",
    "Cruelty Free Cosmetics: We believe animals belong in our arms, not in a lab; All of our makeup is certified and acknowledged by PETA as a cruelty free brand; We don't test any of our products on animals",
    "Discover NYX Professional Makeup: Try all of our professional makeup products today from eyeshadow, eyeliner, and false lashes to liquid lipstick, lip gloss, primer, concealer, setting sprays and eyebrow makeup"],
    price: 4.97,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nyx-butter-gloss.jpg"
  )

  # p42.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nyx-butter-gloss.jpg"),
  #   filename: "nyx-butter-lip"
  # })   


  #43
  p43 = Product.create!(
    product_name: "The Dreamer by Versace for Men 3.4 oz Eau de Toilette Spray",
    description: "Design House: Juicy Couture Fragrance Notes: Mandarin Orange, Green Apple, Black Currant, Guava, Rose Petals. Year Introduced: 2013. Add a touch of Hollywood glamour to your daily beauty routine with Couture La Malibu for women. This youthful fragrance from Juicy Couture effortlessly blends citrus and sweet elements together for an unforgettable aroma. Hints of apple, guava, red currant and mandarin are mingled with aquatic notes for a fresh, light fragrance. Designed to capture the carefree spirit of Southern California, this scent is best suited for daytime wear in the spring or summer.",
    bullets: ["Dreamer by Versace for Men 3.4 oz Eau de Toilette Spray: Buy Versace Colognes - Versace, the Dreamer, is an innovative clear and smooth blend between wild and aromatic plants including juniper, mugwort, and tarragon. An essential beginning allowing an almost immediate glimpse of the richness, refinement, highest quality of reach.",
    "Item Condition: 100% authentic, new and unused. The Dreamer by Versace for Men 3.4 oz Eau de Toilette Spray.",
    "Type: Eau De Toilette"],
    price: 34.99,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dreamer-versace.jpg"
  )

  # p43.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dreamer-versace.jpg"),
  #   filename: "dreamer-versace"
  # })   


  #44
  p44 = Product.create!(
    product_name: "Nautica Voyage Eau De Toilette for Men - Fresh, Romantic, Fruity Scent - Woody, Aquatic Notes of Apple, Water Lotus, Cedarwood, and Musk - Ideal for Day Wear - 3.3 Fl Oz",
    description: "Nautica Voyage Eau De Toilette for Men - Fresh, Romantic, Fruity Scent - Woody, Aquatic Notes of Apple, Water Lotus, Cedarwood, and Musk - Ideal for Day Wear - 3.3 Fl Oz",
    bullets: ["ROMANTIC AND FRUITY: For an active and romantic man who lives by his own rules.",
    "FRESH AND MASCULINE: Fresh and salty sea breeze that carries romantic scents of coastal herbs and woods.",
    "VERSATILE AND LONG-LASTING: Can be worn casually or formally.",
    "NAUTICA FRAGRANCES: Scents that support your curiosity for life, so that you are ready to take on the day, wherever it takes you."],
    price: 18.90,
    inventory: 30,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nautica.jpg"
  )

  # p44.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nautica.jpg"),
  #   filename: "nautica"
  # })   


  #45
  p45 = Product.create!(
    product_name: "Le Male by Jean Paul Gaultier for Men - 4.2 Ounce EDT Spray, Eau De Toilette Spray",
    description: "#5,507 in Beauty & Personal Care",
    bullets: ["How-to-Use: For long-lasting effects fragrance should be applied to the body’s pulse points",
    "These include the wrist, behind the ear, crease of your arm and knee, and the base of your throat",
    "Pulse points give off more body heat as this is where blood vessels are closest to the skin, therefore continually warming and releasing your fragrance",
    "The package dimension of the product is 8.9cmL x 8.9cmW x 18.1cmH"],
    price: 77.24,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/jean-paul-perfume.jpg"
  )

  # p45.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/jean-paul-perfume.jpg"),
  #   filename: "jean-paul-perfume"
  # })  


  #46
  p46 = Product.create!(
    product_name: "Armaf Club De Nuit Intense Man EDT Men New in Box, Black , 3.6 Fl Oz",
    description: "Club de Nuit Intense Man by Armaf is a Woody Spicy fragrance for men. Club de Nuit Intense Man was launched in 2015",
    bullets: ["Top Notes: Bergamot , Lemon , Pineapple , Black Current",
    "Heart Notes: Birch , Jasmine , Rose",
    "Base Notes: Vanilla, AMbergris, Patchouli"],
    price: 60.00,
    inventory: 18,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/armaf.jpg"
  )

  # p46.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/armaf.jpg"),
  #   filename: "armaf-perfume"
  # })  


  #47
  p47 = Product.create!(
    product_name: "BIC Soleil Smooth Colors Women's Disposable Razors With Aloe Vera and vitamin E Lubricating Strip for Enhanced Glide, With 3 Blades, 14 Count",
    description: "Experience a closer shave when you choose BIC Soleil Smooth Colors Women's Disposable Razors. With 14 shaving razors, this pack lets you stock up on your favorite razors easily. These convenient razors for women feature three blades that adjust to your curves for a smooth shave. The lubricating strip enriched with aloe vera and vitamin E enhances the razor’s glide and is ideal for sensitive skin. Plus, the head adjusts to your curves as you shave, even around your knees and ankles. The comfortable anti-slip grip handle helps provide added confidence and control while shaving. With a variety of colorful hues, these women's razor handles add a refreshing pop of color to your everyday care routine. Add a pack of these ladies razors to your beauty or gym bag to keep your BIC Soleil women’s razors close, so you can achieve a smooth shave – wherever you are! Enjoy a fantastic shave with BIC Soleil Smooth Colors Women’s Razors for shaving.",
    bullets: ["One 14-count pack of BIC Soleil Smooth Colors Women's Disposable Razors with brightly colored handles",
    "Women's razors for shaving with three blades for a closer shave",
    "Shaving razors with a Soothing Moisture Strip and anti-slip handle for enhanced glide and superb control while shaving",
    "Great as a body or leg razor – put a pack in your beauty bag to have quality womens razors whenever you need it",
    "Stock up with BIC Soleil Smooth Colors disposable razors bulk packs, so you always have dependable BIC razors",
    "100% recyclable packaging"],
    price: 19.99,
    inventory: 100,
    category_id: 2,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/razor-bic.jpg"
  )

  # p47.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/razor-bic.jpg"),
  #   filename: "razor-bic"
  # })  


  #48
  p48 = Product.create!(
    product_name: "Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones",
    description: "James Clear is a writer and speaker focused on habits, decision making, and continuous improvement. He is the author of the #1 New York Times bestseller, Atomic Habits. The book has sold over 5 million copies worldwide and has been translated into more than 50 languages. Clear is a regular speaker at Fortune 500 companies and his work has been featured in places like Time magazine, the New York Times, the Wall Street Journal and on CBS This Morning. His popular '3-2-1' email newsletter is sent out each week to more than 1 million subscribers.",
    bullets: ["Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal."],
    price: 14.11,
    inventory: 100,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/atomic-habits.jpg"
  )

  # p48.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/atomic-habits.jpg"),
  #   filename: "atomic-habits"
  # })  


  #49
  p49 = Product.create!(
    product_name: "Lessons in Chemistry: A Novel",
    description: "Chemist Elizabeth Zott is not your average woman. In fact, Elizabeth Zott would be the first to point out that there is no such thing as an average woman. But it’s the early 1960s and her all-male team at Hastings Research Institute takes a very unscientific view of equality. Except for one: Calvin Evans; the lonely, brilliant, Nobel–prize nominated grudge-holder who falls in love with—of all things—her mind. True chemistry results. 

But like science, life is unpredictable. Which is why a few years later Elizabeth Zott finds herself not only a single mother, but the reluctant star of America’s most beloved cooking show Supper at Six. Elizabeth’s unusual approach to cooking (“combine one tablespoon acetic acid with a pinch of sodium chloride”) proves revolutionary. But as her following grows, not everyone is happy. Because as it turns out, Elizabeth Zott isn’t just teaching women to cook. She’s daring them to change the status quo.  

Laugh-out-loud funny, shrewdly observant, and studded with a dazzling cast of supporting characters, Lessons in Chemistry is as original and vibrant as its protagonist.",
    bullets: ["#1 NEW YORK TIMES BESTSELLER • GOODREADS CHOICE AWARD WINNER • Meet Elizabeth Zott: a “formidable, unapologetic and inspiring” (PARADE) scientist in 1960s California whose career takes a detour when she becomes the unlikely star of a beloved TV cooking show in this novel that is “irresistible, satisfying and full of fuel” (The New York Times Book Review) and “witty, sometimes hilarious...the Catch-22 of early feminism.” (Stephen King, via Twitter)",
    "A BEST BOOK OF THE YEAR: The New York Times, Washington Post, NPR, Oprah Daily, Entertainment Weekly, Newsweek",
    "“The most delightful novel I read this year...fresh and surprising...I laughed out loud!”—Philip Galanes, The New York Times"],
    price: 18.26,
    inventory: 10,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lessons-in-chem.jpg"
  )

  # p49.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lessons-in-chem.jpg"),
  #   filename: "lesson-chemistry"
  # })    


  #50
  p50 = Product.create!(
    product_name: "It Starts with Us: A Novel (2) (It Ends with Us)",
    description: "Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.

But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.

Switching between the perspectives of Lily and Atlas, It Starts with Us picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of Perfect Neighbors) bestselling phenomenon It Ends with Us left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, New York Times bestselling author).",
    bullets: ["Before It Ends with Us, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (USA TODAY) #1 New York Times bestseller It Ends with Us."],
    price: 10.49,
    inventory: 20,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/It-Starts-with-Us-2.jpg"
  )

  # p50.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/It-Starts-with-Us-2.jpg"),
  #   filename: "starts-with-us-2"
  # })      


  #51
  p51 = Product.create!(
    product_name: "It Ends with Us: A Novel (1)",
    description: "Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.

Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.

As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.

An honest, evocative, and tender novel, It Ends with Us is “a glorious and touching read, a forever keeper. The kind of book that gets handed down” (USA TODAY).",
    bullets: ["From the #1 New York Times bestselling author of It Starts with Us and All Your Perfects, a “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, New York Times bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love—soon to be a major motion picture starring Blake Lively and Justin Baldoni."],
    price: 9.99,
    inventory: 35,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/it-ends-with-us-2.jpg"
  )

  # p51.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/it-ends-with-us-2.jpg"),
  #   filename: "ends-with-us-1"
  # })     


  #52
  p52 = Product.create!(
    product_name: "The Seven Husbands of Evelyn Hugo: A Novel",
    description: "Aging and reclusive Hollywood movie icon Evelyn Hugo is finally ready to tell the truth about her glamorous and scandalous life. But when she chooses unknown magazine reporter Monique Grant for the job, no one is more astounded than Monique herself. Why her? Why now?

Monique is not exactly on top of the world. Her husband has left her, and her professional life is going nowhere. Regardless of why Evelyn has selected her to write her biography, Monique is determined to use this opportunity to jumpstart her career.

Summoned to Evelyn’s luxurious apartment, Monique listens in fascination as the actress tells her story. From making her way to Los Angeles in the 1950s to her decision to leave show business in the ‘80s, and, of course, the seven husbands along the way, Evelyn unspools a tale of ruthless ambition, unexpected friendship, and a great forbidden love. Monique begins to feel a very real connection to the legendary star, but as Evelyn’s story near its conclusion, it becomes clear that her life intersects with Monique’s own in tragic and irreversible ways.

“Heartbreaking, yet beautiful” (Jamie Blynn, Us Weekly), The Seven Husbands of Evelyn Hugo is “Tinseltown drama at its finest” (Redbook): a mesmerizing journey through the splendor of old Hollywood into the harsh realities of the present day as two women struggle with what it means—and what it costs—to face the truth.",
    bullets: ["NEW YORK TIMES BESTSELLER

“If you’re looking for a book to take on holiday this summer, The Seven Husbands of Evelyn Hugo has got all the glitz and glamour to make it a perfect beach read.” —Bustle

From the New York Times bestselling author of Daisy Jones & the Six—an entrancing and “wildly addictive journey of a reclusive Hollywood starlet” (PopSugar) as she reflects on her relentless rise to the top and the risks she took, the loves she lost, and the long-held secrets the public could never imagine."],
    price: 9.42,
    inventory: 99,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/7-husbands.jpg"
  )

  # p52.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/7-husbands.jpg"),
  #   filename: "7-husband"
  # })       


  #53
  p53 = Product.create!(
    product_name: "Bittersweet",
    description: "Named one of the top ten influencers in the world by LinkedIn, Susan Cain is a renowned speaker and author of the award-winning books Quiet Power, Quiet Journal, and Quiet: The Power of Introverts in a World That Can’t Stop Talking. Translated into more than forty languages, Quiet hasappeared on many best-of lists, spent more than seven years on the New York Times bestseller list, and was named the #1 best book of the year by Fast Company, which also named Cain one of its Most Creative People in Business. Her TED Talk on the power of introverts has been viewed over forty million times.",
    bullets: ["#1 NEW YORK TIMES BESTSELLER • Sadness is your superpower. In her new masterpiece, the author of the bestselling phenomenon Quiet explores the power of the bittersweet personality, revealing a misunderstood side of mental health and creativity while offering a roadmap to facing grief in order to live life to the fullest.",
    "“Bittersweet grabs you by the heart and doesn’t let go.”—BRENÉ BROWN, author of Atlas of the Heart
“Susan Cain has described and validated my existence once again!”—GLENNON DOYLE, author of Untamed
“The perfect cure for toxic positivity.”—ADAM GRANT, author of Think Again",
    "LONGLISTED FOR THE PORCHLIGHT BUSINESS BOOK AWARD • ONE OF THE BEST BOOKS OF THE YEAR: The Wall Street Journal, Mashable"],
    price: 14.34,
    inventory: 100,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/bittersweet.jpg"
  ) 

  # p53.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/bittersweet.jpg"),
  #   filename: "bittersweet"
  # })      


  #54
  p54 = Product.create!(
    product_name: "You're My Little Cuddle Bug",
    description: "From Valentine’s Day to Christmas Day and every day in between, the bestselling You’re My Little series is cute as can be—and festive too! Each spread of these chunky board books shows a child and parent pair with adorable illustrations by Natalie Marshall, as well as shaped cut-outs and raised elements. Perfect for cuddling up with your little one, these sweet rhyming stories celebrates a parent’s love for their child.",
    bullets: ["Celebrate your little cuddle bug with this colorful, rhyming interactive board book!",
    "“You’re My Little Cuddle Bug is sure to become one of your family’s favorite books,” says NAPPA Director Elena Epstein. “This charming book will capture your child’s imagination while celebrating love and hugs.”",
    "Celebrate your little cuddle bug with this sweet and colorful rhyming board book! With chunky pages for little hands and die-cut cuddle bugs to add depth and interest, children will love the interactive features alongside the story.",
    "From Valentine’s Day to Christmas Day and every day in between, the bestselling You’re My Little series is cute as can be—and festive too! Each spread of these chunky board books shows a child and parent pair with adorable illustrations by Natalie Marshall, as well as shaped cut-outs and raised elements. Perfect for cuddling up with your little one, these sweet rhyming stories celebrates a parent’s love for their child."],
    price: 7.74,
    inventory: 100,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cuddlebug.jpg"
  ) 

  # p54.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cuddlebug.jpg"),
  #   filename: "cuddlebug"
  # })      


  #55
  p55 = Product.create!(
    product_name: "I Love You to the Moon and Back",
    description: "Amelia Hepworth lives in London with her family and two elderly sausage dogs. When she is not writing stories, she enjoys spending time with her little boy and daydreaming in the garden. Usually not at the same time.",
    bullets: ["Show a child just how strong your love is every minute of the day! Features a 'To' and 'From' personalization page, making this sweet offering an ideal gift for baby showers, birthdays, and new parents.",
    "The sun rises, and a bear and cub begin their day together. They splash in the water, climb mountains, watch the colorful lights in the shimmering sky, and play with friends. They show their love for each other by touching noses, chasing each other, and, of course, hugging and snuggling before bed. A sweet, gentle rhyme, perfect for sharing with a special little one that also includes a 'To' and 'From' personalization page in the front of the book, making this heartwarming book an ideal gift."],
    price: 4.76,
    inventory: 99,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/moon-n-back.jpg"
  )

  # p55.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/moon-n-back.jpg"),
  #   filename: "moon-n-back"
  # })     


  #56
  p56 = Product.create!(
    product_name: "The 5 Love Languages: The Secret to Love that Lasts",
    description: "#33 in Books",
    bullets: ["Over 20 million copies sold!",
    "A perennial New York Times bestseller for over a decade!",
    "Falling in love is easy. Staying in love—that’s the challenge. How can you keep your relationship fresh and growing amid the demands, conflicts, and just plain boredom of everyday life?",
    "In the #1 New York Times international bestseller The 5 Love Languages, you’ll discover the secret that has transformed millions of relationships worldwide. Whether your relationship is flourishing or failing, Dr. Gary Chapman’s proven approach to showing and receiving love will help you experience deeper and richer levels of intimacy with your partner—starting today.",
    "The 5 Love Languages is as practical as it is insightful. Updated to reflect the complexities of relationships today, this new edition reveals intrinsic truths and applies relevant, actionable wisdom in ways that work.",
    "Includes the Couple's Personal Profile assessment so you can discover your love language and that of your loved one."],
    price: 8.35,
    inventory: 0,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/5-love-languages.jpg"
  ) 

  # p56.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/5-love-languages.jpg"),
  #   filename: "5-love-languages"
  # })    


  #57
  p57 = Product.create!(
    product_name: "The Four Agreements: A Practical Guide to Personal Freedom (A Toltec Wisdom Book)",
    description: "#26 in Books",
    bullets: ["In The Four Agreements, bestselling author don Miguel Ruiz reveals the source of self-limiting beliefs that rob us of joy and create needless suffering. Based on ancient Toltec wisdom, The Four Agreements offer a powerful code of conduct that can rapidly transform our lives to a new experience of freedom, true happiness, and love.",
    'A New York Times bestseller for over a decade',
    "Translated into 46 languages worldwide"],
    price: 7.74,
    inventory: 0,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/4-agreememts.jpg"
  ) 

  # p57.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/4-agreememts.jpg"),
  #   filename: "4-agreements"
  # })  


  #58
  p58 = Product.create!(
    product_name: "The Very Hungry Caterpillar",
    description: "Eric Carle is acclaimed and beloved as the creator of brilliantly illustrated and innovatively designed picture books for very young children. His best-known work, The Very Hungry Caterpillar, has been translated into 70 languages and sold over 55 million copies. Carle illustrated more than seventy books, many best sellers, most of which he also wrote, and more than 170 million copies of his books have sold around the world. In 2003, Carle received the Laura Ingalls Wilder Award (now called the Children’s Literature Legacy Award) for lifetime achievement in children's literature. In 2002, Eric and his wife, Barbara, cofounded The Eric Carle Museum of Picture Book Art (www.carlemuseum.org) in Amherst, Massachusetts, a 40,000-square-foot space dedicated to the celebration of picture books and picture book illustrations from around the world, underscoring the cultural, historical, and artistic significance of picture books and their art form. Eric Carle passed away in May 2021 at the age of 91. His work remains an important influence on artists and illustrators at work today. www.eric-carle.com",
    bullets: ["THE all-time classic picture book, from generation to generation, sold somewhere in the world every 30 seconds! A sturdy and beautiful book to give as a gift for new babies, baby showers, birthdays, and other new beginnings!",
    "THE all-time classic picture book, from generation to generation, sold somewhere in the world every 30 seconds! A sturdy and beautiful book to give as a gift for new babies, baby showers, birthdays, and other new beginnings!"],
    price: 6.56,
    inventory: 0,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/caterpillar.jpg"
  ) 

  # p58.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/caterpillar.jpg"),
  #   filename: "hungry-caterpillar"
  # })   


  #59
  p59 = Product.create!(
    product_name: "Things We Never Got Over (Knockemout)",
    description: "Lucy Score is a New York Times, USA Today and Wall Street Journal bestselling author. She grew up in a literary family who insisted that the dinner table was for reading and earned a degree in journalism. She writes full-time from the Pennsylvania home she and Mr. Lucy share with their obnoxious cat, Cleo. When not spending hours crafting heartbreaker heroes and kick-ass heroines, Lucy can be found on the couch, in the kitchen, or at the gym. She hopes to someday write from a sailboat, oceanfront condo, or tropical island with reliable Wi-Fi.",
    bullets: ["Bearded, bad-boy barber Knox prefers to live his life the way he takes his coffee: Alone. Unless you count his basset hound, Waylon.",
    "Knox doesn’t tolerate drama, even when it comes in the form of a stranded runaway bride.",
    "Naomi wasn’t just running away from her wedding. She was riding to the rescue of her estranged twin to Knockemout, Virginia, a rough-around-the-edges town where disputes are settled the old-fashioned way…with fists and beer. Usually in that order.

Too bad for Naomi her evil twin hasn’t changed at all. After helping herself to Naomi’s car and cash, Tina leaves her with something unexpected. The niece Naomi didn’t know she had. Now she’s stuck in town with no car, no job, no plan, and no home with an 11-year-old going on thirty to take care of.

There’s a reason Knox doesn’t do complications or high-maintenance women, especially not the romantic ones. But since Naomi’s life imploded right in front of him, the least he can do is help her out of her jam. And just as soon as she stops getting into new trouble he can leave her alone and get back to his peaceful, solitary life.

At least, that’s the plan until the trouble turns to real danger."],
    price: 10.94,
    inventory: 12,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/things-we-never-got-over.jpg"
  ) 

  # p59.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/things-we-never-got-over.jpg"),
  #   filename: "things-we-never-got-over"
  # })  


  #60
  p60 = Product.create!(
    product_name: "Things We Hide from the Light (Knockemout Series, 2)",
    description: "#23 in Books",
    bullets: ["New York Times and USA Today bestselling author Lucy Score returns to Knockemout, Virginia, following fan-favorite Things We Never Got Over with Knox's brother Nash's story.",
    "Nash Morgan was always known as the good Morgan brother, with a smile and a wink for everyone. But now, this chief of police is recovering from being shot and his Southern charm has been overshadowed by panic attacks and nightmares. He feels like a broody shell of the man he once was. Nash isn't about to let anyone in his life know he's struggling. But his new next-door neighbor, smart and sexy Lina, sees his shadows. As a rule, she's not a fan of physical contact unless she initiates it, but for some reason Nash's touch is different. He feels it too. The physical connection between them is incendiary, grounding him and making her wonder if exploring it is worth the risk.

Too bad Lina's got secrets of her own, and if Nash finds out the real reason she's in town, he'll never forgive her. Besides, she doesn't do relationships. Ever. A hot, short-term fling with a local cop? Absolutely. Sign her up. A relationship with a man who expects her to plant roots? No freaking way. Once she gets what she's after, she has no intention of sticking around. But Knockemout has a way of getting under people's skin. And once Nash decides to make Lina his, he's not about to be dissuaded…even if it means facing the danger that nearly killed him."],
    price: 13.52,
    inventory: 100,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/things-we-hide.jpg"
  ) 

  # p60.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/things-we-hide.jpg"),
  #   filename: "things-we-hide"
  # })    


  #61
  p61 = Product.create!(
    product_name: "Tomorrow, and Tomorrow, and Tomorrow: A novel",
    description: "#20 in Books",
    bullets: ["NEW YORK TIMES BEST SELLER •WINNER OF THE GOODREADS CHOICE AWARD • Sam and Sadie—two college friends, often in love, but never lovers—become creative partners in a dazzling and intricately imagined world of video game design, where success brings them fame, joy, tragedy, duplicity, and, ultimately, a kind of immortality. It is a love story, but not one you have read before.",
    "From the best-selling author of The Storied Life of A. J. Fikry: On a bitter-cold day, in the December of his junior year at Harvard, Sam Masur exits a subway car and sees, amid the hordes of people waiting on the platform, Sadie Green. He calls her name. For a moment, she pretends she hasn’t heard him, but then, she turns, and a game begins: a legendary collaboration that will launch them to stardom.",
    "These friends, intimates since childhood, borrow money, beg favors, and, before even graduating college, they have created their first blockbuster, Ichigo. Overnight, the world is theirs. Not even twenty-five years old, Sam and Sadie are brilliant, successful, and rich, but these qualities won’t protect them from their own creative ambitions or the betrayals of their hearts.",
    "Spanning thirty years, from Cambridge, Massachusetts, to Venice Beach, California, and lands in between and far beyond, Gabrielle Zevin’s Tomorrow, and Tomorrow, and Tomorrow examines the multifarious nature of identity, disability, failure, the redemptive possibilities in play, and above all, our need to connect: to be loved and to love."],
    price: 15.49,
    inventory: 20,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/tomorrow.webp"
  ) 

  # p61.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/tomorrow.webp"),
  #   filename: "tomorrow"
  # })     

  #62
  p62 = Product.create!(
    product_name: "Goodnight Moon",
    description: "#3 in Children's Classics",
    bullets: ["In this classic of children's literature, beloved by generations of readers and listeners, the quiet poetry of the words and the gentle, lulling illustrations combine to make a perfect book for the end of the day.",
    "In a great green room, tucked away in bed, is a little bunny. 'Goodnight room, goodnight moon.' And to all the familiar things in the softly lit room—to the picture of the three little bears sitting on chairs, to the clocks and his socks, to the mittens and the kittens, to everything one by one—the little bunny says goodnight.",
    "One of the most beloved books of all time, Goodnight Moon is a must for every bookshelf. This board book edition is the right size for little hands and is the perfect gift for baby showers, toddler birthday parties, and holidays."],
    price: 5.36,
    inventory: 99,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/goodnight-moon.jpg"
  ) 

  # p62.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/goodnight-moon.jpg"),
  #   filename: "goodnight-moon"
  # })  

  #63
  p63 = Product.create!(
    product_name: "How to Win Friends & Influence People",
    description: "#42 in Books",
    bullets: ["You can go after the job you want—and get it!",
    "You can take the job you have—and improve it!",
    "You can take any situation—and make it work for you!",
    "Dale Carnegie’s rock-solid, time-tested advice has carried countless people up the ladder of success in their business and personal lives.",
    "chieve your maximum potential—a must-read for the twenty-first century with more than 15 million copies sold!"],
    price: 10.40,
    inventory: 99,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/win-friends.jpg"
  ) 

  # p63.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/win-friends.jpg"),
  #   filename: "win-friends"
  # })  


  #64
  p64 = Product.create!(
    product_name: "Flash Cards: Sight Words",
    description: "#38 in Books",
    bullets: ["Give your child a head start in reading with these colorful, double-sided Sight Words Flash Cards that feature the first 100 words from the Fry List. An essential tool in building reading fluency!",
    "includes 54 cards"],
    price: 2.88,
    inventory: 99,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/flas-cards.jpg"
  ) 

  # p64.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/flas-cards.jpg"),
  #   filename: "flash-cards"
  # })  


  #65 
  p65 = Product.create!(
    product_name: "The Subtle Art of Not Giving a F*ck: A Counterintuitive Approach to Living a Good Life",
    description: "#1 New York Times Bestseller",
    bullets: ["#1 New York Times Bestseller",
    "Over 10 million copies sold",
    "In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be 'positive' all the time so that we can truly become better, happier people.",
    "For decades, we’ve been told that positive thinking is the key to a happy, rich life. 'F**k positivity,' Mark Manson says. 'Let’s be honest, shit is f**ked and we have to live with it.' In his wildly popular Internet blog, Manson doesn’t sugarcoat or equivocate. He tells it like it is—a dose of raw, refreshing, honest truth that is sorely lacking today. The Subtle Art of Not Giving a F**k is his antidote to the coddling, let’s-all-feel-good mindset that has infected modern society and spoiled a generation, rewarding them with gold medals just for showing up.",
    "Manson makes the argument, backed both by academic research and well-timed poop jokes, that improving our lives hinges not on our ability to turn lemons into lemonade, but on learning to stomach lemons better. Human beings are flawed and limited—'not everybody can be extraordinary, there are winners and losers in society, and some of it is not fair or your fault.' Manson advises us to get to know our limitations and accept them. Once we embrace our fears, faults, and uncertainties, once we stop running and avoiding and start confronting painful truths, we can begin to find the courage, perseverance, honesty, responsibility, curiosity, and forgiveness we seek.",
    "There are only so many things we can give a f**k about so we need to figure out which ones really matter, Manson makes clear. While money is nice, caring about what you do with your life is better, because true wealth is about experience. A much-needed grab-you-by-the-shoulders-and-look-you-in-the-eye moment of real-talk, filled with entertaining stories and profane, ruthless humor, The Subtle Art of Not Giving a F**k is a refreshing slap for a generation to help them lead contented, grounded lives."],
    price: 25.99,
    inventory: 99,
    category_id: 3,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/subtle-art.jpg"
  ) 

  # p65.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/subtle-art.jpg"),
  #   filename: "subtle-art"
  # })  


  #66 

  p66 = Product.create!(
    product_name: "Exercise Bike, CHAOKE Stationary Bike for Home, Indoor Cycling Bike with Heavy Flywheel, Comfortable Seat Cushion, Digital Monitor, Multi-Grips Handlebar1",
    description: "CHAOKE indoor exercise bike equipped with resistance system and silent belt drive for home cardio or gym workout.",
    bullets: ["【Strong and Stable】CHAOKE exercise bike is made of thickened frame tube, which give this indoor cycling bike a rock solid build, overcomes the unsteady issue of most stationary bikes on the market. There was no shaking or squeaking whether you are riding standing or riding.",
    "【100 Micro-adjustable Resistance】Resistance system gives you the experience of a realistic, real-road feeling. Simply turn the knob to increase or decrease the adjustment to the different levels that best suit you.Push down emergency brake will bring the indoor bike to an immediate stop.",
    "【Make Exercise More Fun】The Digital Monitor will real-timely track and record your exercise time, speed, distance, calories, and pulse, so that you can know your progress and adjust your exercise plan in time. The Tablet mount allows your to follow your fitness courses or just enjoy movie or music when spinning.",
    "【Fully Adjustable】The height of handle and seat are adjustable to fit those users with different heights (Recommended User Height: 4.8 ft - 6.1 ft). The toe-caged pedals are designed with adjustable straps, fit for different size feet well. All family members can join in the exercise today!",
    "【Silent Ride】Riding on this spin bike can promote blood circulation and burn calories, and exercise your arm, waist, hip and leg muscles. Experience a smooth and quiet ride with the maintenance free belt drive system which allows you to workout without disturbing others.",
    "【Customer First】 Every customer who purchases a CHAOKE exercise bike is entitled to a one-month free return and exchange guarantee, and we promise one year of free accessories replacement. Meeting customer needs is our service tenet. Please contact us with any questions, it is our pleasure to serve you."],
    price: 249.99,
    inventory: 5,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/chaoke-bike.jpg"
  ) 

  # p66.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/chaoke-bike.jpg"),
  #   filename: "chaoke-art"
  # })    

  #67
  
  p67 = Product.create!(
    product_name: "Mini Exercise Bike, himaly Under Desk Bike Pedal Exerciser Portable Foot Cycle Arm & Leg Peddler Machine with LCD Screen Displays",
    description: "Innovative Spacesaver Design With Easylift Assist Means Your Treadmill Can Fold Up After Your Run For Compact, Simple Storage; Auxiliary Music Port And Dual 2-Inch Speakers Provide Entertainment",
    bullets: ["【Home Pedal Exerciser】: Combined with Arm & Leg exercise by adjustable multi-level resistance , this mini bike trainer can target at providing different exercising level to train your muscle group, upper & lower body exercises with best effect to keep fit.",
    "【Adjustable Pedal Resistance】: The pedal exerciser with adjustable resistance whirling, you can set different level resistance according to different groups, different exercising degree of difficulty for different exercising period.",
    "【Digital LCD Display】: The multi function LCD monitor displays time, count, calories and distance (unit:meter), Moreover includes a scan feature that can show all measurements in sequence, make you know your exercising journey more easily.",
    "【Lightweight & Portable Design】: With compact design, mini size: 40.5x32x19cm / 15.9x12.5x7.4inch, weight: 4kg / 8lb, you can training at anywhere and anytime, such as home, office, even outside, no limited for such small body.",
    "【Easy Assembly】: Pedal exerciser with all supplied accessories, in few minutes and without asking for any tools. The anti-slip pedal and the non-slip bike foot provide excellent attachment and will not slip during exercise."],
    price: 49.99,
    inventory: 2,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mini-bike-himaly.jpg"
  ) 

  # p67.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mini-bike-himaly.jpg"),
  #   filename: "mini-bike-himaly"
  # })   
  
  #68

  p68 = Product.create!(
    product_name: "YOSUDA Indoor Cycling Bike/Magnetic Resistance Stationary Bike - Cycle Bike with Ipad Mount & Comfortable Seat Cushion",
    description: "#2 in Exercise Bikes",
    bullets: ["EXERCISE BIKE",
    "【Smooth Stationery Bike】35lbs flywheel and heavy-duty steel frame of the exercise bike guarantee the stability while cycling. The belt driven system provides a smoother and quieter ride than chain transport. It won't disturb your apartment neighbors or sleeping kids.",
    "【Personalized Fit Exercise Bike】2-ways adjustable non-slip handlebar, 4-ways padded seat (inseam height 25-35in) and a large range of resistance give users a comfortable indoor riding experience. Workout your muscles / lose weight / enhance heart /lung function. 270 lbs weight capacity.",
    "【LCD Monitor and Ipad Mount】The LCD monitor on exercise bike tracks your time, speed, distance, calories burned and odometer. The gift Ipad holder allows you to enjoy exercising and music at the same time, making it easier to keep exercising.",
    "【Safe to Use】The adjustable cage pedals on exercise bike protects you from a fast ride. Press the resistance bar to stop the flywheel immediately. The water bottle holder allows you to replenish water in time. Transport wheels help you easily move this cycle machine. All parts are protected and your little baby can't reach them.",
    "【What You Get】A YOSUDA exercise bike, all tools and instructions are in the package. Online instruction video can help you complete the assembly within 30 minutes. ONE YEAR FREE parts replacement."],
    price: 209.99,
    inventory: 0,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/yosuda-bike.jpg"
  ) 

  # p68.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/yosuda-bike.jpg"),
  #   filename: "yosuda-bike"
  # })   


  #69
  
  p69 = Product.create!(
    product_name: "NordicTrack T Series Treadmills",
    description: "himaly Mini Exercise Bike Indoor Portable Home Pedal Exerciser",
    bullets: ["30-Day Ifit Membership Included; Stream Live & On-Demand Workouts On Your Equipment With Global Workouts & Studio Classes; Elite Trainers Adjust Your Equipment (15 Dollar Value)",
    "10% Onetouch Incline Control; 10 Mph Smart Onetouch Speed Control; With Ifit, Your Trainer Auto-Adjusts Your Speed And Incline Through A Smart Bluetooth Connection",
    "Smart-Response Motor For Effective Speed, Interval, And Endurance Training; 20 inches X 55 inches Tread Belt Offers Plenty Of Leg And Elbow Space As You Run; Flexselect Deck Cushioning Protects Your Joints",
    "Innovative Spacesaver Design With Easylift Assist Means Your Treadmill Can Fold Up After Your Run For Compact, Simple Storage; Auxiliary Music Port And Dual 2-Inch Speakers Provide Entertainment",
    "300-Pound User Capacity; Protected With A 10-Year Frame Assurance, 2-Year Parts Assurance, And 1-Year Labor Assurance; 54 inches H X 36 inches W X 73.5 inches L"],
    price: 699.00,
    inventory: 100,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nordic-treadmill.jpg"
  ) 

  # p69.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nordic-treadmill.jpg"),
  #   filename: "nordic-treadmill"
  # })  


  #70
  
  p70 = Product.create!(
    product_name: "Home Foldable Treadmill with Incline, Folding Treadmill for Home Workout, Electric Walking Treadmill Machine 15 Preset or Adjustable Programs 250 LB Capacity MP3",
    description: "Why choose our foldable treadmill?

√Our folding treadmill allows you to enjoy a healthy life anytime, anywhere. Today, start running with a home treadmill, embark on the road to fitness, exceed your expectations, and continue running!
√ For a truly effective approach to weight loss and toning, our Folding Treadmill is your perfect companion.
Product Description

The treadmill is a new model that designed for online sale specially,equipped with adequate functions to meet the exercise needs of different groups of people. It is also equipped with extra functions - MP3,manual incline and air spring. Music is available when you are running on the treadmill,air spring makes operation easier and foldable design brings space saving. It will be a pleasant experience if you choose this treadmill for home gym fitness.

Product Features

- The treadmill is equipped with 5 inch LCD display and 2 pre-set programs, one-touch operation helps you to enjoy the running at home. You can monitor real-time data for each exercise, including speed, time, calories, distance and pulse.

-Its powerful and energy-efficient motor produces smooth and seamless operation and the anti-slip belt and soft-grip handlebar make your session a comfortable and controlled experience.
-Other great features include safety tether key, smooth wheels for easy mobility and tablet holder.",
    bullets: ["☆ The treadmill is equipped with 5 inch LCD display and 15 pre-set programs, one-touch operation helps you to enjoy the running at home. You can monitor real-time data for each exercise, including speed, time, calories, distance and pulse.",
    "☆The treadmill is equipped with a 2.5HP peak power motor and one set intelligent electronic controllers which can not only bring you a silent running experience but also keep the stable running speed from 0.6 MPH to 7.5 MPH (1 - 12 KM/H).",
    "☆Fast Control Handle ：There are three manually adjustable tilt buttons.You can press the BUTTON on the handle to start or stop at any moment. Good for multiple running styles combining running & jogging & walking.",
    "☆Foldable design (by air spring) helps the end user to assemble the treadmill easily and effectively,it's also easy to move and store the treadmill.Electric treadmill use the large Multi-layer Tread Belt , which provides extra space for comfortable running, making running safer and more comfortable, more importantly, a wide walking belt, better footsteps, less prone to touching your feet.",
    "☆Foldable Design & Low Noise Motor and Safety Emergency: Foldable designand transportation wheels allow for easy move and storage. This foldable treadmill comes with built in safety key to ensure instant shut-off under emergency situation.The 2.5HP motor ensures perfect performance for walking, jogging, running and cardio workout at home. Provide safe and quiet workout experience."],
    price: 99.00,
    inventory: 99,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/home-foldable-treadmill.jpg"
  ) 

  # p70.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/home-foldable-treadmill.jpg"),
  #   filename: "home-foldable-treadmill"
  # })  


  #71

  p71 = Product.create!(
    product_name: "Amazon Basics Rubber Encased Hex Dumbbell Hand Weight",
    description: "Amazon Basics Rubber Encased Hex Dumbbell Hand Weight",
    bullets: ["Dumbbell hand weight for exercise and strength training; ideal for use in fitness classes, home gym, or workout area",
    "Includes a single 25 pound dumbbell with a solid cast iron core",
    "Non-slip textural surface for a secure grip",
    "Hexagonal black rubber-encased ends prevent rolling and promote stay-in-place storage",
    "Product dimensions: 12.5 x 5.3 x 4.6 inches (LxWxH) with 1.4-inch grip diameter"],
    price: 40.93,
    inventory: 100,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/weight-training-dumbbell.jpg"
  ) 

  # p71.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/weight-training-dumbbell.jpg"),
  #   filename: "amazon-dumbbell"
  # })  


  #72

  p72 = Product.create!(
    product_name: "Adjustable Dumbbell 25/55LB 5 In 1 Single Dumbbell for Men and Women Multiweight Options Dumbbell with Anti-Slip Nylon Handle Fast Adjust Weight for Home Gym Full Body Workout Fitness",
    description: "#1,097 in Sports & Outdoors",
    bullets: ["【5 In 1 Weights Training】: 5/10/15/20/25LB, you only need single dumbbells, you can have 5 sets of dumbbell training experience, the weight can be adjusted according to your own level, this cleverly designed product meets fitness hobbies the needs of practitioners and professional weight trainers.",
    "【1-Second Adjustment】: Turn the handle with one hand to quickly adjust to the required weight. There will be a corresponding pointer and a click sound to let you know that the adjustment is completed, allowing you to enjoy a simpler and smoother workout.",
    "【New Safety Structure Design】: double safety buckles on the tray and handle bar, so that the adjustable dumbbells can only be adjusted on the tray, ensuring the safety and stability of the dumbbell pieces during exercise after leaving the tray.",
    "【The Benefits of Dumbbell Exercise】: The multi-weight one-piece design of dumbbells is very suitable for specific part and whole body exercises, bringing benefits such as building muscles, burning calories, improving cardiovascular and eliminating strength imbalances for your body and mind.",
    "【Great Gift】: This easy-to-adjust dumbbell is an excellent choice for a healthy gift for family, friends and yourself in terms of appearance, quality and function."],
    price: 98.99,
    inventory: 9,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/adjustable-dumbbell.jpg"
  ) 

  # p72.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/adjustable-dumbbell.jpg"),
  #   filename: "adjustable-dumbbell"
  # })  

  #73

  p73 = Product.create!(
    product_name: "CAP Barbell 150 LB Coated Hex Dumbbell Weight Set and Storage Rack | Multiple Handle Option",
    description: "The CAP 150-Pound Rubber Dumbbell Set with Rack is a great addition to your home gym for toning and sculpting your arms, shoulders, back, and legs.

With this set, you'll get 5 pairs of dumbbells, plus an a-frame dumbbell rack to keep them off the floor.

This is the perfect set for your home gym and for fitness enthusiasts.",
    bullets: ["SET INCLUDES – A pair of 5-pound, 10-pound, 15-pound, 20-pound, and 25-pound rubber hex dumbbells with a black A-frame dumbbell rack to store the weights. E-commerge packaging. This set ships in multiple boxes.",
    "SPACE-SAVING DESIGN – The A-frame design of this rack maximizes floor space by storing dumbbells in an “A” shape, or vertical fashion. Easily access and store dumbbells. Rubber inserts prevent dumbbells and rack from scratches",
    "DURABLE AND RELIABLE – Rack is made with steel and finished with durable black powder coat. Heads are made from ASTM A48 Class 20 grey iron and joined together by a 1018 cold rolled solid steel handle (sizes 15-120lb) with an extreme durable rubber coating.",
    "VERSATILE – Dumbbells offer the ability to target specific muscle groups or perform a full body workout. Perfect for isolations, functional and HIIT workouts, and strength training routines",
    "FEATURES – The original hex shaped heads prevent rolling. The medium depth knurling on the handle provides essential grip and security during use. Rubber coating is a durable and effective finish"],
    price: 225.00,
    inventory: 0,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dumbbell-storage-rack.jpg"
  ) 

  # p73.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dumbbell-storage-rack.jpg"),
  #   filename: "dumbbell-storage-rack"
  # })  


  #74

  p74 = Product.create!(
    product_name: "Alllvocles Resistance Band, Pull Up Bands, Pull Up Assistance Bands, Workout Bands, Exercise Bands, Resistance Bands Set for Legs, Working Out, Muscle Training, Physical Therapy, Shape Body, Men Women",
    description: "No latex Resistance Bands are the perfect tool for resistance exercise in the clinic, at the gym, at home, or on the go. elastic resistance has been proven to increase strength, mobility, and function, as well as reduce joint pain.",
    bullets: ["High Quality Material: Resistance bands made from 100% high-grade natural rubber to prevents bands snapping and provide longer durability.",
    "Different Color & 4 Pull Up bands levels: Set of 4 pcs Pull up assist bands correspond to different colors, Yellow(5-10 lbs), Red(15-30 lbs), Black(30-60 lbs), Purple (60-100 lbs), 81 inches in length and can be used alone or combine multiple workout bands to increase the challenge.",
    "Suitable for Variety of Exercise & Multifunctional: Resistance bands offers effective training, suitable for a variety of exercise to Calorie Burning, Muscle Building and Fat Shredding Workout Program to work out your arms, shoulders, chest, gluteus, legs etc.",
    "Lightweight and portable: The resistant bands set is portable and come with a waterproof bag for you to carry it anywhere, so you can use this resistance bands set to exercise, be it to your home, gym or even as you travel therefor you can continue with your work-out routine anywhere you go.",
    "Great idea for a gift-It can meet your workout need for anyone looking to expand a home gym, build a fitness regimen, exercise on the go, or physical therapy whether you are a beginner or not."],
    price: 19.99,
    inventory: 10,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/alllvocles.jpg"
  ) 

  # p74.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/alllvocles.jpg"),
  #   filename: "alllvocles"
  # })  


  #75

  p75 = Product.create!(
    product_name: "Fit Simplify Resistance Loop Exercise Bands with Instruction Guide and Carry Bag, Set of 5",
    description: "Resistance Bands - 5 Loop Fitness Bands Set - Loop Exercise Resistance Bands - Exercise Bands For Legs And Arms - Carry Bag",
    bullets: ["High End Exercise Bands. Our 12 inch By 2 inch Heavy Duty Loop Resistance Bands Come In 5 Varying Resistance Levels. This Makes Them Perfect Whether You Are Just Starting To Workout Or A Seasoned Workout Warrior. Our Extra Light And Light Bands Are Great For Beginners, While Our Medium, Heavy And Extra Heavy Exercise Bands Are Targeted For More Intermediate And Advanced Strength Training.",
    "Great With Any Workout. This Resistance Band Set Can Be Integrated Seamlessly With Various Popular Workout Program. Or Use Them For General Exercise, Stretching, Strength Training, Power Weight Programs. The Included Carry Bag Makes It Easy To Take Your Bands With You And Do Any Workout Away From Home Or Your Home Gym.",
    "Multiple Uses. While These Resistance Bands Are Often Used For Sports And Fitness, Physical Therapists Love These Physical Therapy Bands (Rehab Bands) To Help Them Rehabilitate Their Patients. Our Stretch Bands Work For People Suffering From Leg, Knee And Back Injuries. They Are Also Perfect For Use By Women After Pregnancy And Birth To Keep Their Bodies In Shape.",
    "Superior Quality. All Of Our Exercise Resistance Bands Are Thoroughly Tested Before We Ship Them Out To You. This Ensures Your Bands Are Easy On Skin And Will Provide You With A Worry Free Experience. The Instruction Booklet Includes Dozens Of Different Illustrated Exercises That Demonstrate How To Use Our Resistance Bands For Legs, Arms, Back, Shoulders, Ankles, Hips And Stomach.",
    "What You Get: Five Exercise Bands With Color-Coded Resistance Levels, Portable Travel Carry Bag And Instruction Guide."],
    price: 12.95,
    inventory: 0,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/fit-simplify-band.jpg"
  ) 

  # p75.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/fit-simplify-band.jpg"),
  #   filename: "fit-simplify-band"
  # })  


  #76

  p76 = Product.create!(
    product_name: "Resistance Bands Set, Exercise Bands for Physical Therapy, Yoga, Pilates, Rehab and Home Workout, Non-Latex Elastic Bands Set of 3",
    description: "Physical Therapy Bands, Resistance Bands, Exercise Bands",
    bullets: ["【Good Quality Exercise Bands】: Never snap or tear. Not sticky and latex-free material, eco-friendly, elastic and durable. RENRANRING bands have very good elasticity which provides the proper amount of tension needed to really work your muscles, best choice for upper & lower body exercises.",
    "【3 Level Resistance】: Come with 3 color(yellow, red, blue), the different colors have an obviously different tension/strength. 3 versions workout bands for stretching, muscle toning, improving balance, conditioning & rehabbing muscles. 5 ft long by 6 inches wide.",
    "【Physical Therapy Bands】: Most people choose our bands to do some physical therapy that wasn't in a loop or attached to handles. Besides, suitable for Rehabilitation, Wrestling, Bodybuilding, Pilates, Yoga, Kickboxing, Crossfit and so on.",
    "【Portable & Easy to Use】: Each band folds up to roughly the size of a pocket pack of facial tissues, so it is easy to take. When you start use it, just take a couple wraps around your hands for a secure grip. Ideal for any at-home workout, hotel workout, or at-home physical therapy program.",
    "【Customer Service】: If you are not satisfied with RENRANRING resistance bands set, please feel free to contact us, we will fully refund. And we hope customers to give suggestions for improvement."],
    price: 8.45,
    inventory: 99,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/resistance-band-set.jpg"
  ) 

  # p76.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/resistance-band-set.jpg"),
  #   filename: "resistance-band-set"
  # })  


  #77

  p77 = Product.create!(
    product_name: "Amazon Basics 1/2-Inch Extra Thick Exercise Yoga Mat",
    description: "Amazon Basics 1/2-Inch Extra Thick Exercise Yoga Ma",
    bullets: ["100% NBR foam",
    "Imported",
    "Extra thick mat for yoga, gym, and everyday exercise",
    "Textured foam construction provides traction and stability",
    "1/2 inch thick mat provides extra support, shock-absorption, and comfort",
    "Elastic straps secure rolled-up mat; includes shoulder strap for easy carrying",
    "Please check the mat will not slip on the floor before using",
    "Dimensions: 74 x 24 x .5 inches"],
    price: 25.56,
    inventory: 20,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/amazon-basic-mat.jpg"
  ) 

  # p77.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/amazon-basic-mat.jpg"),
  #   filename: "amazon-basic-mat"
  # })  


  #78
  
  p78 = Product.create!(
    product_name: "ProsourceFit Exercise Puzzle Mat, EVA Foam Interlocking Tiles Protective and Cushion Flooring for Gym Equipment, Exercise and Play Area",
    description: "The Prosource Fit Exercise Puzzle Mat allows you to piece together a protective floor wherever you need. The foam mat tiles provide an impact-absorbing space for working out, and a durable surface for equipment that covers 24 square feet.",
    bullets: ["PROTECTIVE EXERCISE FLOORING - Durable, non-skid textured squares and tiles that cover and protect your floor or even carpet while creating a comfortable workout room with exercise accessories or as a playmat for children",
    "EASY ASSEMBLY – Lightweight interlocking foam tiles connect quickly and easily, and can be disassembled just as simply for quick storage",
    "VERSATILE – The water-resistant, noise-reducing design is easy-to-clean, great for indoor purposes like in garages as a protector, gyms, a home fitness room, or even children’s play areas as a playmat.",
    "COVERS 24 SQ. FT. - Each tile measures 24 inch x 24 inch x ½ inch- thick from the highest point of the texture; Includes 6 tiles and 12 end borders for a polished look. Care: Apply a combination of warm water and household or dish soap with a soft cloth or towel, and rub gently to wash. Air dry or wipe with a dry cloth.",
    "HIGH-QUALITY FOAM - High-density EVA foam provides excellent support and cushion; Contains NO toxic phthalates. Excellent alternative to rubber floor mats."],
    price: 25.89,
    inventory: 40,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/prosource-puzzle-mat.jpg"
  ) 

  # p78.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/prosource-puzzle-mat.jpg"),
  #   filename: "prosource-puzzle-mat"
  # })  


  #79
  
  p79 = Product.create!(
    product_name: "ProsourceFit Tri-Fold Folding Thick Exercise Mat 6’x2’ with Carrying Handles for Tumbling, MMA, Martial Arts, Gymnastics, Stretching, Core Workouts",
    description: "Prosource Fit Tri-Fold Folding Exercise Mats make various forms of training possible to do anywhere, anytime. Ideal for stretching, martial arts, yoga, gymnastics, and core and strengthening workouts.",
    bullets: ["EASY TO CARRY - Tri-fold design is compact for storage, and two carrying handles makes fitness on-the-go convenient",
    "THICK CUSHION - Provides a cushioned, supportive surface for workouts, stretch-ing, martial Arts, or outdoor fitness routines",
    "JOINT PROTECTION - Resilient foam interior keeps its shape for long-term usability, and protects knees, wrists, elbows & back. Waterproof",
    "DURABLE - Vinyl surface resists tearing or stretching and is easy to wipe clean; great for stretching & floor exercises",
    "3 COLOR OPTIONS - Comes in blue, grey, and black. Dimensions: 72 inch Lx 24 inchW x 1 1/2 inch T. Material - PVC and EPE foam"],
    price: 40.99,
    inventory: 15,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/tri-fold-mat.jpg"
  ) 

  p79.photo.attach({
    io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/tri-fold-mat.jpg"),
    filename: "prosource-tri-fold-mat"
  })  


  #80

  p80 = Product.create!(
    product_name: "Retrospec Solana 1 inch Yoga Mat",
    description: "Our premier, thick yoga and exercise mat is available in two sizes (1” and ½”) for the utmost support and balance during your practice. Alleviate pain and stress on joints, neck, back, and knees while finding balance on Solana’s ribbed, no-slip, thick material. BPA free and free of harsh chemicals that ruin the vibe. Solana is your go-to mat from salutations, meditations, and wherever your practice lands from sun up to sundown.",
    bullets: ["EXTRA THICK FOR COMFORT & BALANCE: Solana firm 1-inch extra thick fitness mat w/ mat strap alleviates stress on pressure points such as joints, hips, hands, and knees. Solana measures 72 inch X 24 inch X ½ inch.",
    "NON-SLIP GRIP: Solana's non-slip material keeps you steady and balanced while staying securely on the floor. The innovative design helps prevent injury and allows you to focus on your practice or workout.",
    "DURABLE & PORTABLE: Solana's thick, durable material allows for everyday use, regardless of the intensity of your exercise. Solana comes equipped with a nylon carrying strap so you can easily transport it from your home practice to studio salutations.",
    "FREE OF HARSH CHEMICALS: Our products are free of Phthalate, heavy metals and latex. Your mat may initially release a harmless odor. If so, unroll your mat and air it for a day or two before using.",
    "EASY TO CLEAN: Solana is easy to keep clean and fresh for your next workout. Use a mix of gentle soap and water, wipe clean, and hang it to dry. Do not submerge."],
    price: 35.56,
    inventory: 3,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/retrospec-mat.jpg"
  ) 

  # p80.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/retrospec-mat.jpg"),
  #   filename: "retrospec-mat"
  # })  


  #81
  
  p81 = Product.create!(
    product_name: "321 STRONG Foam Roller - Medium Density Deep Tissue Massager for Muscle Massage and Myofascial Trigger Point Release, with 4K eBook",
    description: "The 321 STRONG solid core, medium density foam roller uses patented technology to deliver a therapeutic self massage comparable to a professional massage from a physical therapist. The 3 unique massage zones replicate the thumbs, fingers, and palms so you can get the exact massage you’re looking for. These 3 massage zones help to increase blood flow and circulation to problem areas, decreasing recovery time, and increasing mobility, flexibility, and range of motion.

Built to last, our solid core massage roller with EVA tread is made from top grade materials, and won’t lose its shape over time, even with daily use. Its lightweight materials make transport a breeze, and its compact design allows you to properly focus pressure on the affected areas.",
    bullets: ["12. 75 inches x 5. 25 inch diameter ,  lightweight yet rugged solid core massage roller with EVA tread and triple grid 3D massage zones mimics the finger , palm , and thumb of a therapist's hands .",
    "Medium density muscle roller is comfortable to use - making it easy for beginners , but still effective at penetrating the soft tissue layer of tired muscles . Soft enough to use while in pain from lower back injury , sciatica or plantar fasciitis .",
    "One of the best recovery tools to treat muscle pain , increase performance and flexibility. Rolling before and after exercise sis part of a great stretching routine . Increases blood flow to massage site , flushing away stored lactic acid .",
    "Stretch overworked and strained muscles of the leg , arms , and feet by rolling during your warm up and cool downs . Provides instant benefit to the hamstring , IT band , glutes , and calves by delivering superior massages at home or in the gym .",
    "Loved by runners , exercise athletes , yoga and pilates students , swimmers , physical or sports therapy patients , and aid those just doing a normal fitness workout . Great for the arch of the foot , and any part of the superior body but the spine or neck .",
    "Protected by 5 US Patents : 9,345,921 ; 9,539,167 ; 9,656,112 ; 10,278,890 ; 10,695,260",
    "eBook Companion Guide - Please download our companion eBook right here on this page, under the section called 'Product guides and documents' or eBook can be downloaded for free via the manufacture’s website, also arrives as an email attachment"],
    price: 28.99,
    inventory: 45,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/321-roller.jpg"
  ) 

  # p81.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/321-roller.jpg"),
  #   filename: "321-foam-roller"
  # }) 


  #82
  
  p82 = Product.create!(
    product_name: "Chirp Wheel Foam Roller - Targeted Muscle Roller for Deep Tissue Massage, Back Stretcher with Foam Padding",
    description: "The Chirp Wheels are made with a rigid ABS plastic core and soft EVA compression sensitive mat so that the wheel can support up to 500 pounds! It is also light to travel with and comfortable to roll on",
    bullets: ["INNOVATIVE & FUNCTIONAL DESIGN: Chirp Wheel+ is designed with trigger points in mind to break up tight muscle fibers and hard-to-reach parts in your back instead of putting undue pressure on your spine, so you can focus on deeper stretches without worries. Our 12 inch wheel back stretcher gives gentle pressure massage and specifically targets the area in contact with the muscles at any given point providing a satisfying amount of pressure in general.",
    "BUILT-TO-LAST QUALITY: Our back stretcher wheel provides your back with a soft and comfortable experience. Chirp Wheel+ body roller is made with a durable skid-resistant 1/2 inch-thick sweat-resistant foam padding, a soft EVA compression-sensitive mat, and a sturdy PVC-free ABS plastic core that withstands the weight of up to 500 lbs. Our back stretcher roller wheels are also light to travel with for on-the-go back exercise just about anywhere.",
    "TARGETS KEY PRESSURE POINTS: Our back stretching equipment is designed to fit right between your shoulder blades and features a patent-pending spinal canal allowing for a comfortable massage along both sides of the spine. Our body roller wheel puts compression on the muscles surrounding the spine. In doing so, the muscles are stretched and ultimately targeted, which helps in releasing pressure to your back.",
    "SATISFYING DEEP STRETCHES: Our Chirp Wheel+ back stretcher is made specifically for fitness and deep tissue massage. If you're looking for an all-in-one rolling device or stretching equipment to help release pressure on your body, our back stretcher wheel is perfect for you. Each size provides a different pressure and specifically targets your back where it needs to. Experience deep stretches you've never had without flexing or bending under pressure.",
    "EASY TO USE: Roll the back pressure away in less than 5 minutes a day. Simply sit down, place the wheel at your back, and lean back for the perfect at-home massage. Our back stretcher wheel can be used on the ground or while sitting down in your favorite chair, so you can do what feels ideal on your back! Pick your pressure, the smaller the wheel, the more targeted the pressure; the larger the wheel, the greater the opening effect in the chest."],
    price: 59.99,
    inventory: 9,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/wheel-roller.jpg"
  ) 

  # p82.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/wheel-roller.jpg"),
  #   filename: "wheel-roller"
  # }) 


  #83

  p83 = Product.create!(
    product_name: "Neck and Shoulder Relaxer, Cervical Traction Device for TMJ Pain Relief and Cervical Spine Alignment, Chiropractic Pillow, Neck Stretcher (Purple)",
    description: "#74 in Health & Household",
    bullets: ["Relief neck pain in just 10 mins per day.",
    "Simple and effective physical solutions to sooth away stiff neck, helps in restoring proper cervical curvature associated with consistent use.",
    "Dense and soft foam design provides sturdy, lightweight, and comfortable base.",
    "Can't be used as an ordinary pillow all night long.",
    "Normally you will need 1-3 days to adapt to this pillow, because your neck needs time to familiar with the new corrector curvature. You will enjoy an extreme comfort after you get used to it!"],
    price: 19.99,
    inventory: 9,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/neck-relaxer.jpg"
  ) 

  # p83.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/neck-relaxer.jpg"),
  #   filename: "neck-relaxer"
  # }) 


  #84

  p84 = Product.create!(
    product_name: "Yes4All Vinyl Coated Kettlebell Weights, Weight Available: 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 Lb - Strength Training Kettlebells for Weightlifting, Conditioning, Strength & Core Training",
    description: "SWING AWAY PAIN WITH YES4ALL KETTLEBELL- LET’S SWING IN MORE POWER AND ENERGY High-quality Vinyl Coated Cast Iron Kettlebell: Built to last without wear and tear - constructed of solid cast iron with no welds, weak spots, or seams. Great for training indoor & outdoor, whether at home or in the gym. Shiny Vinyl Coating: Encased nice shiny vinyl coating for an appealing look and floor –damage prevention. Solid Steel Handle: The vinyl kettlebells are manufactured with SOLID STEEL HANDLE to give you the best experience while practicing. The handle is slightly textured to help you perform slow controlled movements without destroying your hands. Flat Bottom: Our kettlebells feature flat bottoms making it easy to store and expand your exercises that a regular kettlebell does not offer. Available in different weights: Yes4All Vinyl Coated Kettlebell: 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 Lb Yes4All Vinyl Coated Kettlebells With Protective Rubber Base: 5, 10, 12, 15, 20, 25, 30, 35, 40, 45, 50 Lb HAVE A LIFETIME OF HEALTH BENEFITS WITH YOUR KETTLEBELLS Improve strength, stamina and coordination Increase lung and heart capacity Prevent cardiovascular diseases, heart attack or strokes Total body cardio workout, burn fat and effective toning Works great for your stabilizing muscles - for active recovery Improve movement, agility and speed USE FOR FITNESS IMPROVEMENTS AND CHALLENGES Turkish Get Up Single Dead Lift Two Handed Kettlebell Swing Kettlebell Squat and Lunges WARRANTY 1-year warranty and 30-day return.",
    bullets: ["Cast Iron",
    "Imported",
    "HIGH-QUALITY CAST IRON CONSTRUCTION: Built to last of solid cast iron with no welds, weak spots, or seams. Great for training indoor & outdoor",
    "DURABLE VINYL COATED FINISH: Encased with vinyl to prevent corrosion, increase durability, reduce noise, protect flooring & enhance appearance",
    "WIDE, SMOOTH HANDLE: Smooth, high-quality slightly textured handle provides a comfortable & secure grip for high reps, makes chalk no longer necessary",
    "FLAT BOTTOM FOR STABILITY: Enable upright storage, ideal for renegade rows, handstands, mounted pistol squats & other exercises requiring a kettlebell with a flat bottom",
    "IDEAL FOR ANY AGE OR GENDER: Wide range of weights ideal for anyone wanting to improve fitness. Used for swings, deadlifts, squats, get-ups & snatches to work out many muscle groups and body parts including biceps, shoulders, legs, & more"],
    price: 20.59,
    inventory: 8,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kettleball.jpg"
  ) 

  # p84.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kettleball.jpg"),
  #   filename: "kettleball"
  # }) 



  #85

  p85 = Product.create!(
    product_name: "Amazon Basics Vinyl Coated Cast Iron Kettlebell Weight",
    description: "Amazon Basics Vinyl Coated Cast Iron Kettlebell Weight",
    bullets: ["Kettlebell for fitness exercises, including agility training, cardio, endurance, squats, lunges, and more",
    "Includes a 15 pound kettlebell made of iron for long lasting strength; weight clearly printed on each side",
    "Pink vinyl coating shows the weight at a glance, plus protects floors, reduces noise, and prevents corrosion",
    "Textured, gently curved, wide handle helps ensure a comfortable, secure grip; hold with one hand or two",
    "Product dimensions: 6.88 x 4.3 x 7.5 inches (LxWxH)"],
    price: 26.00,
    inventory: 6,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/amazon-kettleball.jpg"
  ) 

  # p85.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/amazon-kettleball.jpg"),
  #   filename: "amazon-kettleball"
  # }) 



  #86

  p86 = Product.create!(
    product_name: "Jump Rope, Tangle-Free Rapid Speed Jumping Rope Cable with Ball Bearings for Women, Men, and Kids, Adjustable Steel Jump Rope Workout with Foam Handles for Fitness, Home Exercise & Slim Body",
    description: "#1 in Jump Ropes",
    bullets: ["【Durable & Adjustable Rope】 This jump rope is made of steel wires that are coated with strong PVC material, making it durable even after a long time exercising. Its adjustable length design enables you to customize the length according to your needs, making it suitable for everyone, no matter for kids or adults.",
    "【Jump Fast, Jump easily】 Built-in with high-quality ball bearings, the skipping rope provides you with comfortable jump exercises. It supports fast jumps while protecting you from any potential tangles, satisfying your needs for safety and convenience at the same time.",
    "【Ergonomic Foam Handles】 The ergonomic handles are well designed for your safety and convenience: they are covered with soft sponges, which makes the handles comfortable to hold. And the non-slip & moisture-wicking features also keep your palms dry, making your every exercise comfortable and safe!",
    "【Get Fitness Anytime & Anywhere】 No matter you’re women or men, kids or adults, beginner or an experienced person, you can start jumping ropes anytime and anywhere. It’s easy and efficient, and it helps to strengthen your body, lose weight, and increase stamina.",
    "【Portable & Easy to Carry】 You can easily carry jump ropes for fitness with you. Put it in your pocket and jump rope for workout with it when needed, it’s that convenient. We are also happy to serve you! If you have any questions, please contact us and we’ll give a satisfying solution."],
    price: 8.99,
    inventory: 8,
    category_id: 4,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/jumprope.jpg"
  ) 

  # p86.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/jumprope.jpg"),
  #   filename: "jumprope"
  # }) 



  #87

  p87 = Product.create!(
    product_name: "Reoxvo Dainty Gold Chain Bracelets Set for Women 14K Real Gold Plated Link Chain Bracelets for Women Trendy Gold Stackable Bracelets for Women Adjustable 7 inch + 2 inch",
    description: "#6,447 in Clothing, Shoes & Jewelry ",
    bullets: ["【Perfect for sensitive skin】100% won't make your wrist green, these 14k gold bracelets are made of high quality material with 14k real gold plating which is durable enough to ensure no tarnish. lead-free, nickel-free and hypoallergenic,friendly to sensitive skin.",
    "【5 Separate layered bracelets】This stackable bracelets for women consists of a 5 style chain bracelets. Including satellite chain/paperclip link chain/mirror chain/figaro chain/cuban chain. You can wear all of them or separate. You have a choice how you wear them for your everyday.",
    "【Adjustable bracelets】This gold bracelets set for women are available in 7inch+2inch adjustable chain, and that is good to wear under a hoodie or with a tee and is super cute! It’s perfect to stack with another bracelets as well.",
    "【Good quality】Our dainty gold bracelets set looks expensive and will be exceeded your expectations, Each gold chain are well made and looks real, don’ t worry that the gold bracelets for women trendy will burden your wrist, bc it’s so lightweight.",
    "【Some Tips】These gold jewelry for women are packaged with nice BOX and ideal as a gift for women And we offer 60 days free return or exchange if you have any question,we will reply you in within 24 hours."],
    price: 15.99,
    inventory: 50,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/Reoxvo+bracelets.jpg"
  ) 

  # p87.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/Reoxvo+bracelets.jpg"),
  #   filename: "reoxvo-bracelets"
  # }) 


  #88

  p88 = Product.create!(
    product_name: "Ross-Simons Jade 'Good Fortune' Bracelet in 18kt Gold Over Sterling",
    description: "To find your bracelet size, use a flexible measuring tape and gently wrap it around the wrist below the wrist bone. Don’t have a measuring tape? Use a flat ribbon or string and check your measurement against a ruler. Add approximately ½” to the measurement for children’s bracelets. For teens and adults, add ½” to 1” and choose the closest size. In between sizes? If you like a closer fit, size down. If you like a more generous drape, size up. Expert tip: Measure a favorite bracelet to easily determine your ideal size!",
    bullets: ["18kt yellow gold over sterling silver, green jade bracelet for women. 3/8 inch wide. 7.5 inch long. Box clasp provides security that blends seamlessly into the design.  Includes jewelry presentation box and 30-day, 100% money-back guarantee.",
    "GREEN JADE BRACELET FOR WOMEN: This elegant green jade bracelet for women is a gorgeous addition to any woman's jewelry box. Lovely worn alone or paired with complementary bangles or chain bracelets, this is a truly versatile bracelet.",
    "ROSS-SIMONS QUALITY: Treat yourself to the luxury & beauty of Ross-Simons fine jewelry. Whether in 14kt gold, 18kt gold, or gorgeous sterling silver, our finely crafted jewelry is an unforgettable, unique gift for women.",
    "ROSS-SIMONS IS a trusted name in fine jewelry for 65 years & counting. From elegant 14kt gold bangles to tennis bracelets & byzantine necklaces to classic gold hoop earrings & diamond stud earrings, we offer fine jewelry for women for every occasion.",
    "GIVE THE GIFT OF JEWELRY: A timeless & traditional holiday or anniversary gift for a woman or girl of any age, Ross-Simons jewelry in luminous 14kt gold, 18kt gold, or 925 sterling silver, is the perfect gift to let her know just how much you care. Due to the naturally occurring characteristics of gemstones, each is unique and may exhibit imperfections such as inclusions , blemishes and cloudiness, as well as color variations."],
    price: 119.00,
    inventory: 88,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/jade-ross.jpg"
  ) 


  # p88.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/jade-ross.jpg"),
  #   filename: "jade-ross"
  # }) 

  
  #89

  p89 = Product.create!(
    product_name: "[Healing Trust] Green Jade Bracelet for Men Women Entrepreneur Business Luck, MONEY ATTRACTION Chakra Bracelets for Women, Bead Bracelets for Women, Maximum Money Wealth Abundance Bracelet, Prosperity Good Luck Feng Shui, Jade Bracelet Goals Manifestation Chakra Bracelet, HAPPY MOOD BRACELET, MONEY Bracelet, Jade Green Healing Crystal Bracelet, Chakra Bracelet Healing Meditation, Spiritual gifts for women and men, Pulseras Para Hombres",
    description: "HEALING TRUST is a Canadian brand committed to designing styles made with positive intentions and purpose. The combination of A+ high-quality healing crystals in each Healing Trust bracelet is thought out with love to give the destined wearer its life-changing effects.

From the bespoke quality of beads to the strategic placement of each bead and spacer, Healing Trust is right with you through creating the vibrations you want to receive and give off in the world.",
    bullets: ["🎁 REAL STONE JADE BRACELET🎁 : A Hidden Treasure! This green jade bracelet with good auspicious wishes is given as a special gift. It can attract money luck, prosperity, good longevity to the wearer. Jade is one of the oldest gemstones that is said to provide emotional, physical and spiritual support. This jade bracelet is known as a green jade wealth bracelet. One of the best chakra bracelets for that encompasses everything..",
    "🎁JADE BRACELET FOR MEN 🎁 :  This lucky green jade bracelet is more than just a pretty accessory. Its green jade beads possess the natural healing energy of the earth and is said to attract wealth and prosperity. Wear it with pride, knowing that both your wrist and your bank account are more secure when they're adorned with this simple but powerful piece of jewelry. Pulseras para hombres. Classy style chakra bracelet for men and women.",
    "🎁JADE BRACELET FOR WOMEN 🎁 : Jade crystals can wave away dirty energy by harmonizing and balancing your energy within. Green jade is a chakra stone that promotes happiness and relationship stability. It is the perfect gift to build friendship and relationships for the ones you love. Natural green jade crystals is an auspicious stone for wealth.",
    "🎁 BEADED BRACELETS for Men and Bracelets for Women 🎁 : This Unisex Wealth Feng Shui Bracelet is handmade with natural gemstones (8mm each) and golden square spacers. Each stretch bracelet is made with care and one-of-a-kind. The beads are held together with strong stretchy cord for easy wear on and take off. This spiritual gift is about 6.5 inches inner length and will fit most wrists. The Chakra Energy of this stretch bracelet attracts wealth, gives money luck and happiness.",
    "🎁 THE LOVE PROMISE 🎁 : HEALING TRUST is committed to providing life-changing spiritual gifts for women and men. These healing crystal gifts such as wealth abundance jewelry, protection bracelet, pulseras para hombres, chakra bracelets and pulseras de mujer are for the soul. Jade for woman and jade for man, bracelets for teen girls, everyone can wear it. Aim to create beautiful beaded bracelets for women and men to give HAPPY MOOD."],
    price: 17.92,
    inventory: 7,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/healing-jade.jpg"
  ) 

  # p89.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/healing-jade.jpg"),
  #   filename: "healing-jade"
  # }) 

  #90

  p90 = Product.create!(
    product_name: "BBTO Howlite Bracelet Black Matte Agate Bracelet Couples Bracelet Distance Bracelet Energy Beads Bracelet for Valentine's Day Present",
    description: "The black beads are matte agate stone, while the white beads are white turquoise (howlite), and the bracelets could help to release stress and gain you some inside peace.",
    bullets: ["General size: the beads is approx. 8 mm/ 0.31 inch in diameter, and the bracelet is approx. 18 cm/ 7.09 inches in circumstance",
    "Quality material: made of natural stone, one pair of the bracelet is stringed together by elastic rope, while the other pair is by cotton string, and it allow you to adjust the size",
    "Special design: the black beads are matte agate stone, while the white beads are white turquoise (howlite), and the bracelets could help to release stress and gain you some inside peace",
    "Wear it in daily life: the bracelets are decorative and applicable, and the interlacing of black and white beads is also meaningful for couples, friends and families",
    "Easy to match: 2 different styles are available, you can select your favorite style to match with your outfits, giving a nice feeling with you all day"],
    price: 8.99,
    inventory: 6,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/howlite-bracelet.jpg"
  ) 

  # p90.photo.attach(
  #   {io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/howlite-bracelet.jpg"),
  #   filename: "howlite-jade"}
  # ) 

  #91

  p91 = Product.create!(
    product_name: "2-20 Carat Certified Classic Diamond Tennis Bracelet Value Collection",
    description: "2-20 Carat Classic Diamond Tennis Bracelet Value Collection",
    bullets: ["Houston Diamond District offers a 30 day return policy on all of its products",
    "We only sell 100% Natural, conflict free diamonds.",
    "Direct Manufacturer Prices & Free Certificate of Authenticity"],
    price: 19800.00,
    inventory: 80,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/expensive-bracelets.jpg"
  ) 

  # p91.photo.attach(
  #   {io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/expensive-bracelets.jpg"),
  #   filename: "diamond-tennis-bracelet"}
  # )   


  #92

  p92 = Product.create!(
    product_name: "1/4-2 Carat Total Weight GIA Certified Round Diamond Stud Earrings 4 Prong Push Back (D-E Color VS1-VS2 Clarity)",
    description: "1/4 - 2 Carat Total Weight GIA Certified Round Diamond Stud Earrings 4 Prong Push Back (D-E Color VS1-VS2 Clarity)",
    bullets: ["Diamond Weight Variance can be +/- 6% as we try to get you the best looking stone",
    "Satisfaction guaranteed. Houston Diamond District offers a 30 day return policy on all of its products",
    "We only sell 100% Natural, un-treated , conflict free diamonds.",
    "Elegant Velvet Earring Box Included",
    "Want a different quality or looking for nicer earrings? We have over 10,000 earrings options available that you can purchase."],
    price: 12520.00,
    inventory: 15,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/earring-expensive-1.jpg"
  ) 


  # p92.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/earring-expensive-1.jpg"),
  #   filename: "diamond-stud-earrings"
  # })    

  #93

  p93 = Product.create!(
    product_name: "PAVOI 14K Gold Colored Lightweight Chunky Open Hoops | Gold Hoop Earrings for Women",
    description: "#148 in Clothing, Shoes & Jewelry",
    bullets: ["PAVOI 4.5mm Thick 20mm Diameter Yellow Gold Earrings for Women",
    "Infinity Earrings are Hypoallergenic; Nickel and Lead-Free with Stainless Steel Post",
    "✦ 90-DAY GUARANTEE ✦ Your happiness is our number one priority. To ensure your complete satisfaction, we offer a hassle-free 90-Day money-back guarantee. To get in touch, email or chat with us - a member of our team will be happy to help you.",
    "✦ SUSTAINABILITY ✦ We’re committed to protecting the planet. That’s why every piece of PAVOI jewelry is crafted with 100% recycled materials and we package in 99% recycled and compostable materials. We are proudly carbon-neutral and completely offset our plastic consumption by removing over 275,000 plastic bottles from our ocean annually. Learn more about our sustainability efforts here.",
    "✦ PROUDLY AMERICAN-OWNED ✦"],
    price: 13.95,
    inventory: 35,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/gold-earring.jpg"
  ) 


  # p93.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/gold-earring.jpg"),
  #   filename: "gold-hoop-earrings"
  # })    

  #94
  
  p94 = Product.create!(
    product_name: "Kendra Scott Elisa Pendant Necklace for Women, Fashion Jewelry, 14k Gold-Plated",
    description: "14K gold plated over brass necklace with stationary pendant.",
    bullets: ["Delicate and Dainty: If you love to layer or gravitate towards simpler styles, this piece is perfect for you. You won’t get tired of the Elisa Pendant Necklace, because it was made with everyday wear in mind.",
    "Versatile: A style made for whatever’s on your schedule that day. Pair it with your favorite cocktail dress or a casual pair of jeans – either way, this necklace is sure to shine.",
    "Details: This necklace measures 0.63 L x 0.38 inch W stationary pendant with 15 inch chain with 2 inch extender.", 
    "Gift Box & Jewelry Bag: Your Kendra Scott Jewelry will arrive pre-packaged in a genuine branded gift box and jewelry bag. This necklace will make a perfect gift for Valentine’s Day, Christmas, your wedding anniversary, Mother’s Day and birthdays.",
    "How to Care for Your Kendra Scott Jewelry: To protect the plating, remove your jewelry prior to hand washing, swimming, exercising, cleaning, and before applying any kind personal body products. Maintain your jewelry’s high shine by avoiding contact with soap, perfume, lotion, makeup, hair & cleaning products."],
    price: 55.00,
    inventory: 55,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kendra-pink-necklace.jpg"
  ) 


  # p94.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kendra-pink-necklace.jpg"),
  #   filename: "kendra-pendant-necklace"
  # })    

  # 95
  
  p95 = Product.create!(
    product_name: "Miabella Solid 18K Gold Over Sterling Silver Italian 5mm Diamond-Cut Cuban Link Curb Chain Necklace for Women Men, 925 Sterling Silver Made in Italy",
    description: "PURE 925 STERLING SILVER & NICKEL-FREE/HYPOALLERGENIC - Made of 92.5% pure sterling silver, this jewelry is a great choice for individuals with very sensitive skin. One of the brightest metals in the world, sterling silver gives your jewelry a brilliant shine. Available in 16”, 18”, 20”, 22”, 24”, 26”, 30”. Necklace, 5/16” wide (7mm). Lobster-claw clasp with spring mechanism for sturdy security.",
    bullets: ["MODERN CLASSIC - Add style to a basic look with this solid 18K gold over sterling silver 5mm Curb chain. Our flat diamond-cut beveled links are much more reflective than the standard curb chain for a rich, perfect shine. It is strong and durable for daily wear yet not too thick for a comfortable fit. Wear alone with casual or formal attire for everyday modern elegance, with a favorite pendant for a personal statement or as a great layering chain. Visit our store for a full selection of chains.",
    "REAL 925 STERLING SILVER & NICKEL-FREE/HYPOALLERGENIC - Made of 92.5% pure sterling silver, this jewelry is a great choice for individuals with very sensitive skin. Gold plated with a thick layer of 1 micron (40 mils or 40 micro inches) 18K yellow gold for added durability. Available in 16”, 18”, 20”, 22”, 24”, 26”, 30”. Necklace, 3/16” wide (5mm). Lobster-claw clasp with spring mechanism for sturdy security.",
    "MADE IN ITALY - Italian jewelry is much more than a fashionable and elegant choice. It is rich in diverse cultural history that has formed a people who still today strongly value creativity and passion. With a high demand for the luxury of their craft, early artisans led the way for the superior design excellence and quality craftsmanship still used today. Italian jewelry has the highest government quality standards unmatched by any other country in the world, making this a fine investment.",
    "PERFECT GIFT FOR HIM OR HER - Stylish unisex chain for those who appreciate unique quality Italian jewelry. This timeless essential is the perfect gift idea for husband, wife, son, daughter, mom, dad, brother, sister, boyfriend, girlfriend, best friend or for you. Give someone special luxurious fine jewelry to rock from day to night with style. VISIT OUR STORE: For a full selection of 18K gold plated silver and sterling silver bracelets, necklaces, rings, earrings and authentic coin jewelry.",
    "GIFT BOX INCLUDED - Miabella jewelry is shipped in an elegant gift box, ready to treat yourself or a loved one for any anniversary, Birthday, Christmas, Father’s Day, Mother's Day, Valentine’s Day, Wedding, Graduation and any other holiday or special occasion gifting. From cool modern to classic vintage, Miabella offers high quality affordable sterling silver jewelry for men and women, comfortable for everyday wear and for all occasions. 30-day, 100% money-back guarantee."],
    price: 39.90,
    inventory: 39,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/chain-necklace.jpg"
  ) 


  # p95.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/chain-necklace.jpg"),
  #   filename: "miabella-necklace"
  # })    


  #96

  p96 = Product.create!(
    product_name: "Paxcoo CN-01 Black Velvet Choker Necklaces with Storage Bag for Women Girls, Pack of 10",
    description: "#12 in Women's Choker Necklaces",
    bullets: ["Quantity: The choker set comes with 10 different chokers including classic, velvet, pendant with, gothic tattoo, lace, vintage Lolita styles to fit your different outfits",
    "Common Size Fits for All Women and Girls: All of the chokers are about 30cm/ 12.2” choker length with 7cm/ 3” adjustable extender chain, can fit for all women, girls and ladies",
    "When to Use: You can wear the choker on Wedding, Dinner, Date, Travel, Party, Dance or casual on your daily life, it can make you seem more beautiful and personality",
    "Drawstring Bag Including: Comes with a premium velvet drawstring bag to storage the chokers or give others as a present",
    "Product Warranty and Customer Service: We provide 48-day money-back and 24-month warranty. So feel free to contact us if you have any question"],
    price: 7.99,
    inventory: 9,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/black-velvet-choker.jpg"
  ) 

  # p96.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/black-velvet-choker.jpg"),
  #   filename: "choker-necklaces"
  # })    



  #97

  p97 = Product.create!(
    product_name: "70 PCS Silver Vintage Goth Punk Rings Set for Men Girls Women, Cool Gothic Ring Pack, Trendy Stackable Boho Chunky Knuckle Emo Full Finger Rings, Adjustable Open Snake Butterfly Ace Eboy Y2k Ring",
    description: "#12,659 in Clothing, Shoes & Jewelry",
    bullets: ["✿COOL PUNK RING PACK✿: These rings set comes in many different styles, include snake, mushroom, feather, butterflies, roses, star, flower, spade ace, Chinese dragon ring, heart and so on...The unique design jewelry is very suitable for those who have a changeable daily style, make you look cool, masculine and accentuate your alluring charm.Bonus points for your overall styling.If you are punk or retro Gothic style rings lover, you're gonna love this ring set!",
    "✿HYPOALLERGENIC SNAKE RING SET✿: It does not contain lead and nickel, Resistance to acid, alkali resistant, anti-fading, it won't produce side effect and harm to human body.Our stacking ring set comes in different sizes, wear it alone or stack them all as you like, just enjoy the fun of DIY, be able to express your own personality.",
    "✿ADJUSTABLE GOTHIC RINGS✿: Adjustable rings for men women with vintage punk style, unique design fully showing your taste and personality. Y2k rings can be suitable for punk men and women, e-boys and girls, you will like them.",
    "✿FASHION & COOL GIFT✿: These punk trendy rings set is a wonderful gift to friends, lovers, and family members. They will be happy to get such gift.",
    "✿AFTER-SALES SERVICE ✿: We will be responsible for our own products. Any questions can be answered and resolved within 12 hours, Thank you very much for your support to our products and brands.And we desire to know your true ideas of all details about the items, so that we can do better at products&service."],
    price: 13.99,
    inventory: 15,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/rings.jpg"
  ) 

  # p97.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/rings.jpg"),
  #   filename: "silver-rings"
  # })    


  #98

  p98 = Product.create!(
    product_name: "15 Pairs Earrings for Men, Black Stainless Steel Earrings Stud Kit for Men Women Fashion Piercing Jewelry Cross Dangle Hoop Earrings Set",
    description: "#6,953 in Clothing, Shoes & Jewelry",
    bullets: ["Earring Set Include - 15 pairs of men's earrings and ear studs come with a beautiful box, 4 pairs of circle earring hoops, 3 pairs of black dangle-hinged hoop earrings, and 8 pairs of different shapes of black ear studs. More wearing choice, suitable for men and women.",
    "Fashion and Classic Style - These black earrings and studs for men and women include many shapes, such as dangle-hinged hoops, circle earrings, and ear studs of various shapes. The surface of the earrings and ear stud is high-polished that looks very shiny and cool. You can wear them to match different clothes and wear them on different occasions. It will make you very attractive.",
    "Hypoallergenic Material Made - All earrings and studs are specially designed for easy wearing and made of 316L medical grade stainless steel, will not fade, are nickel-free and lead-free, safe to wear, It will not uncomfortable to wear for a long time.",
    "Suitable for All Occasions - The earrings set is perfect ideal for prom, parties, birthdays, Valentine's Day, festivals, and daily wearing.",
    "Satisfactory after-sales Service - Each earring and ear stud from Tustrion comes with worry-free 12 months of after-sales service. A replacement or refund is allowed if you are not satisfied with the product, please feel free to contact me to replace the product or get a refund."],
    price: 14.99,
    inventory: 20,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-earrings.jpg"
  ) 

  # p98.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-earrings.jpg"),
  #   filename: "men-earrings"
  # })    


  #99

  p99 = Product.create!(
    product_name: "MOZETO Tie Clips for Men, Black Gold Blue Gray Silver Tie Bar Set for Regular Ties, Luxury Box Gift Ideas (Elegant Style)",
    description: "#7,900 in Clothing, Shoes & Jewelry",
    bullets: ["【Elegant Tie Clips for Men】- MOZETO tie clip goes well with your different ties, basic length and colors are suitable for various occasions, such as valentine's day, christmas, easter, anniversary, engagement, party, meeting, dating, wedding, daily wear, etc.",
    "【Top Quality】- The clip is made of high quality copper, nickel lead free, sturdy and durable, longer service life. High polish and smooth surface, excellent electroplated workmanship, long-time color retention, so they stay looking like new, even after continual use.",
    "【Delicate Design】- This Tie Clips (2.3'' x 0.23'') will ensuring the tie hangs straight and keeps it secured in place, perfect for regular ties, go the whole length of an average size tie.",
    "【Great Gift Selection】- A wonderful gift of treating yourself, to make you more Elegant and Eye-catching. Comes with an Elegant Gift Box, definitely a special gift for boyfriend, father and other male friends for Father's Day, Anniversary, Christmas Day, Graduation.",
    "【100% MONEY BACK GUARANTEED】- 60-day hassle free return. Reply within 24 hours. There are a variety of tie clip styles to choose from."],
    price: 12.99,
    inventory: 3,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mozeto-tie-clips.jpg"
  ) 


  # p99.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/mozeto-tie-clips.jpg"),
  #   filename: "mozeto-tie-clips"
  # })    


  #100

  p100 = Product.create!(
    product_name: "ThunderFit Silicone Ring Men, Step Edge Rubber Wedding Band, 10mm Wide, 2.5mm Thick",
    description: "#2 in Men's Rings",
    bullets: ["True Commitment - Any Place, Any Time - Maximum Safety - workout, gym, weight lifting, water sports, trekking, climbing or any other physical activity? Our silicone wedding bands will be great in replacing your formal wedding band to keep it safe from being scratched or damaged. It is also perfect for extreme duties & manual labor work such as - constructions, military duties, renovation, painting and more.",
    "A Must For An Active Lifestyle – Our silicone flexible wedding ring have an awesome smooth ergonomic design on the top combined with a perfect comfort fit design on the inside. All the combined with an amazing classic wedding ring design, create the perfect silicone wedding ring – by ThunderFit",
    "Top Grade, Hypoallergenic, Flexible Silicone - Our silicone wedding ring made of safe, durable, high quality flexible silicone. Designed to break away when too much pressure is applied. The flexibility of this ring is also perfect for those with large knuckles or temporary swollen fingers.",
    "The Perfect Gift Idea - Our silicone wedding ring is the best idea for a cool & trendy gift – Usually given for anniversary, for his birthday, Valentines and more..",
    "100% Money Back Guarantee – With this 100% Money Back Guarantee you can rest assured that even if the slightest thing won’t match your expectations, you can easily get your money back."],
    price: 9.99,
    inventory: 0,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-ring.jpg"
  ) 

  # p100.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-ring.jpg"),
  #   filename: "silicone-ring-men"
  # })     


  #101

  p101 = Product.create!(
    product_name: "HZMAN Genuine Leather Tree of life Bracelets Men Women, Tiger Eye Natural Stone Lava Rock Beads Ethnic Tribal Elastic Bracelets Wristbands",
    description: "#1 in Men's Cuff Bracelets",
    bullets: ["Designed for personal wearing or to be the christmas, halloween, birthday, anniversary gifts for father, mother, friends, lovers, couples, motorcyclists bikers, tattoo fans... or just yourself",
    "Unisex multilayer fashion bracelet,Wonderful gift for you and your friends.",
    "Dimension:Length from 21.5CM(8.5 inch)",
    "Fine Handcraft,Made of Soft Braided Leather Material,Brown and Black Leather Bracelet Built,Never Out Of Style;Comfortable Wear Feeling",
    "90 DAY MONEY BACK GUARANTEE-100% satisfaction guaranteed. That is our promise. So, if you're not completely happy with your purchase within the first 90 days, just let us know. We will do whatever it takes to make it right"],
    price: 10.99,
    inventory: 2,
    category_id: 5,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-bracelet.jpg"
  ) 

  # p101.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-bracelet.jpg"),
  #   filename: "genuine-leather-men"
  # })     


  #102

  p102 = Product.create!(
    product_name: "BTFBM Women 2023 Summer Sleeveless Tank Dresses Crew Neck Slim Fit Short Casual Ruched Bodycon Party Club Mini Dress",
    description: "The Tank Sleeveless Dress Enchants With A Great Slim Fit Cut And Perfect Decent High Quality Fabric, Attractive Fresh Color Makes You Want Summer, Sun And Beach. The Elastic Shirt Dress Is Given A Feminine Attention By And Enchantingly Round Neckline And Sleeveless Shape. With Sneakers For A Fresh Girlie Look, With Pumps As A Highlight In The Office Or With Boots And Biker Jacket For A Skilful Change In Style. The Casual Solid Color Mini Dress Embodies Femininity With Charm And Chic",
    bullets: ["60% Polyester/35% Viscose /5% Elastane",
    "Imported",
    "Pull On closure",
    "Machine Wash",
    "You Will Never Regret To Get One - Size Guide: S=US 4-6，M=US 8-10，L=US 12-14，XL=US 16-18 / The Womens Summer Dresses Adopts High Quality Fabric Blend Outer Fabric, Soft And Breathable£¬Will Offer You First-Class Comfort; With The Same Color Lining, Makes Sure Will Not See Through; The Comfy And Stretchy Material With Simple And Solid Color Plain T-Shirt Dress Design Makes This Summer Mini Dress Suitable For Most Lady¡¯s Body Shape",
    "Thanks To The Pull On Closure, This Short Dresses Can Be Dressed Up And Down Easily. The Elastic Material Hugs Your Figure Perfectly And The Bodycon Cut Creates A Seductive Silhouette. This Is One Side Ruched Shirt Dress With Irregular Hem Design To Modify Your Body Lines, The Above Knee Length And Wrap Front Look Makes You Look Slimmer And Prolonged The Legs Length",
    "You Will Catch Everyone's Attention In Every Occasions With The Gorgeous Ruched Dress - Combines With Sneakers And Sandals, A Daily Outfit Is Completed, Nicely For Casual Style, Daily Look, Home, Shopping, Hang Out, Lounging, Vacation, Holiday, Beach; With Exquisite Accessories/Jewelry, A Clutch, High Heels, You're The Star At Every Event, Like Party, Cocktail, Clubwear, Night Out, Evening, Dinner, Romantic Date, Wedding, Cruise",
    "There Are Two Different Style Of This Women Casual Short Dress: . Please Pay Attention About That, To Create More Relaxed And Casual Feelings Of This Women Elegant Dress, This Bottom Of The Dress Doesn¡¯t Sew The Hem, That's The Original Design"],
    price: 32.99,
    inventory: 20,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/btfbm-dress.jpg"
  ) 

  # p102.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/btfbm-dress.jpg"),
  #   filename: "btfbm-dress"
  # })    


  #103

  p103 = Product.create!(
    product_name: "Cosonsen Women's Dress Deep V-Neck Long Sleeve Waist Tie Ruffle Mini Swing Skater Dresses",
    description: "#485 in Clothing, Shoes & Jewelry ",
    bullets: ["Dacron",
    "Pull On closure",
    "Machine Wash",
    "★Model Info: Height-5’7” Feet, Bust-30” Inches, Waist-22.5” Inches, Hips-36” Inches, Wearing XS. Refer size chart and review to choose suitable size.",
    "★Material: 100% Dacron. Comfy and soft, proper weight, high quality chiffon like fabric, very flowy and airy. Wash guide: Hand/machine wash cold, air dry.",
    "★Features: Deep V-Neck, tie waist, back zipper closure, long sleeve, flare hem, high waist, regular fit bodice. Mini dress, short dress, skater dress, party dress, fit and flare dress, ruffle dress, casual dress.",
    "★Match ideas: Sandals, heels, sneakers, leggings, necklace, earrings, hats.",
    "★Occasions: Party, dating, cocktail, wedding, shopping, hang-out, night-out, vacation, holiday, fall, winter, spring and summer."],
    price: 40.99,
    inventory: 15,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/consonen-dress.jpg"
  ) 

  # p103.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/consonen-dress.jpg"),
  #   filename: "cosonsen-dress"
  # })    


  #104

  p104 = Product.create!(
    product_name: "ECOWISH Womens V-Neck Spaghetti Strap Bowknot Backless Sleeveless Lace Mini Swing Skater Dress",
    description: "This dress has spaghetti straps and a deep V neckline.
There’s a stunning lace on the chest with an eyelet-style trim, as well as a wide panel high up on the natural waist.
This panel accentuates the waist beautifully, and because it’s higher up on the bodice, your legs will appear elongated too!",
    bullets: ["I00% Polyester", 
    "Tie closure",
    "Hand Wash Only",
    "Material: Our Women Dress is made of Polyester & Cotton. Soft material, light and comfortable, a must-have dress in your wardrobe.",
    "Design: Spaghetti straps, boho fashion, sexy deep v neck and backless, bow tie at back, lace floral pattern, a-line style, pleated design, puffy skirt, short mini Dress. Make you more beautiful, fashion, sexy and elegant.",
    "Occasions: Our Summer Mini Dress for Women is perfect for Beach, Outdoor, Party, Cocktail, Wedding, Club, Dating, Evening or daily wear.",
    "Sizes: Detailed size info please check our product description, any questions, please feel free to contact us.",
    "Washing Care - It’s washing by hand or machine with cold water, do not bleach. hang or line dry."],
    price: 37.99,
    inventory: 30,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ecowish-dress.jpg"
  ) 

  # p104.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ecowish-dress.jpg"),
  #   filename: "ecowish-dress"
  # })    



  #105

  p105 = Product.create!(
    product_name: "MEROKEETY Women's Sleeveless Lace Floral Elegant Cocktail Dress Crew Neck Knee Length for Party",
    description: "The MEROKEETY lace cocktail dress is a classic piece that belongs in every woman’s closet.",
    bullets: ["65% Rayon, 35% Polyester",
    "Imported",
    "Pull On closure",
    "Machine Wash",
    "Size:S(US 2-4) / M(US 6-8) / L(US 10-12) / XL(US 14-16)",
    "If you are in between size,please size up.",
    "Design: Eyelashes lace,Slimming Sheath Style, Full Lace Short Midi Dress, Full Zip Back",
    "Suit for Night date,Cocktail Party, Prom, Wedding, Formal Occasions, Casual Wear, etc",
    "MEROKEETY is an USA registered brand,we accept 30 days free returns."],
    price: 50.99,
    inventory: 50,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lace-dress.jpg"
  ) 

  # p105.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lace-dress.jpg"),
  #   filename: "merokeety-lace-dress"
  # }) 


  #106

  p106 = Product.create!(
    product_name: "MakeMeChic Women's High Waist Pockets Straight Leg Jeans Leather Look Pants",
    description: "#1,712 in Clothing, Shoes & Jewelry",
    bullets: ["60% Viscose, 33% Polyamide, 7% Spandex",
    "Imported",
    "Button closure",
    "Machine Wash",
    "Fabric has some stretch, comfortable to wear",
    "Feature: high waist, button, zipper fly, leather look, pockets, solid color, casual straight leg jeans for women",
    "Machine washable, handwash recommend",
    "Occasions: suitable for casual daily wear"],
    price: 49.99,
    inventory: 0,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/leather-women-pants.jpg"
  ) 

  # p106.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/leather-women-pants.jpg"),
  #   filename: "leather-jeans-women"
  # }) 



  #107

  p107 = Product.create!(
    product_name: "Democracy Women's Ab Solution High Rise Ankle Jean",
    description: "Built from the bottoms up, Democracy blends a universal fit for all shapes and sizes with an effortless aesthetic. Inspired by this multitasking woman with an ageless mindset, Democracy introduces emerging trends in an accessible and affordable way that meets all of her lifestyle needs. Through unparalleled value that fits her body and her wallet. Democracy embraces who she is, enhances what she’s got, elevates her confidence, and evolves her personal style.",
    bullets: ["52% Cotton, 34% Modal, 12% Polyester, 2% Spandex",
    "Imported",
    "Zipper closure",
    "Machine Wash",
    "Democracy’s signature “Ab”solution jean uses innovative construction that incorporates super-stretch denim, slimming panels, a hidden inner elastic waistband, mesh panels, signature curved back yoke, and strategically placed pockets",
    "High Rise Ankle length skinny. Made with soft, premium fabrics"],
    price: 49.94,
    inventory: 10,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/democracy-jeans.jpg"
  ) 


  # p107.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/democracy-jeans.jpg"),
  #   filename: "democracy-high-rise-jeans"
  # }) 


  #108

  p108 = Product.create!(
    product_name: "Levi's Women's Wedgie Straight Jeans",
    description: "The cheekiest jeans in your closet, inspired by vintage Levi's jeans. Special construction lifts backside with iconic leather patch at back waist.",
    bullets: ["85.5% Cotton, 13.5% Polyester, 1% Elastane",
    "Imported",
    "Button closure",
    "Machine Wash",
    "High Rise; Snug through hip and thigh; Button fly; Straight leg",
    "True to Size",
    "Stretch",
    "The model in the image is 5 feet 9 inch and is wearing 27 x 28."],
    price: 47.10,
    inventory: 66,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/levi-jean-straight.jpg"
  )

  # p108.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/levi-jean-straight.jpg"),
  #   filename: "levi-women-straight-jeans"
  # }) 



  #109

  p109 = Product.create!(
    product_name: "Gloria Vanderbilt Women's Classic Amanda High Rise Tapered Jean",
    description: "Gloria Vanderbilt's # 1 selling women's jean in America with over 60 million sold nationwide the Amanda Classic High Rise Tapered Jean. This pant sits at your natural waistline with fully functional pockets, easy front zipper fly, belt loops for your favorite belt and contoured hips for that comfort fit you've come to love. Pairs great with all tops from fashionable to your basic tee shirt and all footwear from stylish heels and trendy boot to your favorite flats! The Amanda high rise Jean gives you the mid section confidence you want and versatility you need in any wardrobe, perfect to wear to work, attending a class or spending time with friends for family. Available in various colors, prints, embroidery and embellishments. Effortlessly fun and stylish. A versatile yet classic look that attracts and connects with the modern sensibility of consumers of all ages.",
    bullets: ["98% Cotton, 2% Elastane",
    "Imported",
    "Zipper closure",
    "Machine Wash",
    "STYLE - high rise jean sits at natural waist with functional pockets, easy zipper fly, belt loops and slight taper leg for the fit you love",
    "VERSATILITY - Goes great with all tops from fashionable to basic a T-shirts and all footwear from stylish boots to your favorit shoes.",
    "LENGTH - This pant comes in a 31 inch regular/average inseam, 29 inch short inseam and 33 inch long inseam with a 15 inch leg opening.",
    "BRAND - Effortlessly fun and stylish Gloria Vanderbilt is a versatile yet classic look that attracts and connects with the modern sensibility of consumers of all ages."],
    price: 14.99,
    inventory: 20,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/gloria-jean.jpg"
  ) 

  # p109.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/gloria-jean.jpg"),
  #   filename: "gloria-vanderbilt-jean"
  # }) 



  #110

  p110 = Product.create!(
    product_name: "AUTOMET Womens Casual Plaid Shacket Wool Blend Button Down Long Sleeve Shirt Fall Jacket Shackets",
    description: "#1,048 in Clothing, Shoes & Jewelry",
    bullets: ["Fabric: 55% Nylon/45% Spandex",
    "Imported",
    "Button closure",
    "Machine Wash",
    "★Material: Made of high quality 55% Nylon/ 45% Spandex fabric, skin-friendly, soft and comfortable to wear, will keep your warm and fashion style in fall,spring and cold winter.",
    "★Feature:It features soft fuzzy fabric, front button closure , and midweight feel for keeping warm all day. It'll be the prefect addition to your wardrobe.Two buttoned chest pockets / long sleeves with button cuffs / plaid pattern / loose fit shacket / collared.This shacket is a must have in your closet!",
    "★Match: You can pair this shirts with variety of tank tops, cami, bodysuit , jeans, denim shorts, jeggings, sneakers or boots to complete casual look that's easy to love all season long.",
    "★Occasion: Perfect for casual daily life,shopping, street wear, working, office, school,holiday, vacation, night out, outdoor etc,suitable for autumn, winter and spring.",
    "★Note: Machine washable/Hand wash cold recommended, do not bleach. Please let us know if there is any question or problem of the jacket, we would response you timely with 24 hours."],
    price: 32.98,
    inventory: 0,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/automet-plaid.jpg"
  ) 

  # p110.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/automet-plaid.jpg"),
  #   filename: "automet-plaid"
  # }) 



  #111

  p111 = Product.create!(
    product_name: "Womens Strapless Crop Top Sexy Sweetheart Neck Ribbed Knit Twisted Knot Front Sleeveless Y2K CamisoleTanks Top",
    description: "#1,675 in Clothing, Shoes & Jewelry",
    bullets: ["95% Polyester and 5% Elastane",
    "Imported",
    "Pull On closure",
    "Machine Wash",
    "Womens Crop Tops: 95% Polyester and 5% Elastane, Super soft, lightweight, stretchy and skin-friendly. Perfect for Spring Summer Fall and Winter, Keep you comfortable, elegant and confident.",
    "Womens Crop Camis Feature: Strapless, Sleevess, Twisted Knot Front,Ribbed Knit,Sweetheart Neckline,Scoop Underbust, Keep you trendy, flattering and eye-catching at any time and anywhere.",
    "Womens Sexy Crop Tops Size & Color: Our model Height: 5’85”,wear size S, Please check our size chart before your order them, Size Attention: XS=US 0-2 S=US 4-6,M=US 6-8,L=US 8-10. Color: White,Green,Beige,Blue,Coffee,Pink and Khaki",
    "Womens Tube Tops Ocassion: Pair with high waist shorts, mini skirts, dress, jeans or pants,perfect for going out, beach, club, party, night out, holiday, weekend, shopping, streetwear, office, daily wear, date, festival, etc.",
    "Washing Instruction: Machine washable, recommend with a laundry bag, do not iron, do not bleach, hang or line dry."],
    price: 20.99,
    inventory: 89,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/sweetheart+crop+top.jpg"
  ) 

  # p111.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/sweetheart+crop+top.jpg"),
  #   filename: "sweetheart-crop-top"
  # }) 



  #112

  p112 = Product.create!(
    product_name: "Hanes Sport Women's Polo Shirt, Women’s Cool DRI Moisture-Wicking Performance Polo Shirt, Women’s Jersey Knit Polo Shirt",
    description: "Want to stay dry no sweat. Our Cool DRI sport shirt's technology keeps you cool and comfortable, even when the competition heats up.",
    bullets: ["100% Polyester",
    "Imported",
    "Button closure",
    "Machine Wash",
    "QUALITY FABRIC – Hanes Sport jersey knit fabric works overtime to keep you cool, dry and protected from the sun. (100% Polyester)",
    "ODOR PROTECTION – Built with FreshIQ, this odor protecting technology attacks odor-causing bacteria so you can feel fresh all day.",
    "QUICK DRY – Hanes Sport women’s polo shirt features innovative Cool DRI technology, allowing the fabric to dry faster. The jersey knit fabric also offers a UPF rating of 50+ for protection against harmful UV rays.",
    "BUTTON PLACKET – This women’s polo shirt is accented with a classic three-button placket and welt collar.",
    "DOUBLE-NEEDLE HEMS – Detailed with double-needle sleeve and bottom hems for a clean-cut finish.",
    "CONTOURED FIT – Hanes Sport performance women’s polo shirt features contemporary styling with a contoured fit. Go up one size for a roomier fit.",
    "COLD WATER WASH – Hanes recommends machine washing this women's shirt in cold water to help reduce energy consumption."],
    price: 14.77,
    inventory: 7,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hanes-polo-shirt.jpg"
  ) 

  # p112.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hanes-polo-shirt.jpg"),
  #   filename: "hanes-polo-shirt"
  # }) 


  #113

  p113 = Product.create!(
    product_name: "CHICWISH Women's Classy Light Tan/Black Open Front Knit Coat Cardigan",
    description: "#1 in Women's Cardigans",
    bullets: ["100% Acrylic",
    "Hand Wash Only",
    "[ Style Details ] Ready to have some fun this layering season? Top your chic fall outfits. with this knit coat! It boasts an open front that’s so ready for topping thick sweaters and knit dresses. Oversized notch lapels add just a smidgen of drama to the otherwise understated design. Also available in olive.",
    "[ Product Details ] Wide collar. Open front. Inserted side pockets. Split hem. Knit fabric provides flexibility. Not lined. 100% Acrylic. Hand wash cold.",
    "[ Occasions ] Great selection for work, walking, vacation, dating and casual look. Cozy up and keep stylish when you pull on this oversized fluffy longline cardigan. It's the perfect way to toss a on a layer last minute to deliver a trendy look effortlessly.",
    "[ Size details ] Please check the size details before ordering ---------------* XS-S fits great to US 0-4. ---------------* M-L fits great to US 6-8. ---------------* XL fits great to US 10.",
    "[ About us ] FREE returns up to 10 days. Chicwish cares for its customers most and we would love to hear any voice from you. If you have any question, suggestion or concern, don't hesitate to speak with us. Thank you for all your support."],
    price: 69.90,
    inventory: 66,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/chiwish-jacket.jpg"
  ) 

  # p113.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/chiwish-jacket.jpg"),
  #   filename: "chicwish-coat"
  # })   


  #114

  p114 = Product.create!(
    product_name: "Ugerlov Women's Oversized Sweaters Batwing Sleeve Mock Neck Jumper Tops Chunky Knit Pullover Sweater",
    description: "You are going to look amazing in this fabulous pullover sweater and we are here for it! This sweater has such a comfy generous fit and that ribbed chunky knit fabric is gorgeous! This sweater features batwing sleeves, a very generous fit, and loose knit fabric.

The knit oversize sweater is our take on what a modern day women would wear. Dreamy, yet sophisticated. Casual, yet chic.",
    bullets: ["Material: Oversized knit pullover sweater made of 78% Merino Wool and 22% Acrylic,very soft, cozy, lightweight to wear",
    "Imported",
    "Pull On closure",
    "Hand Wash Only",
    "Womens long sleeve knitted oversized sweaters, quality chunky sweater can give you boyfriend warm but not heavy",
    "Features: Chic pullover sweaters for women features ribbed knitted, baggy and oversized cutting, batwing long sleeve, stylish mock neck, loose fit, casual style; A cute womens sweater outwear in fall and winter",
    "This cozy long sleeve sweater is such a wonderfully warm choice for any day; Suited for Womens, Ladies, Juniors. Just throw this trendy knit sweater on over a cute cami, jeans, and knee high boots for a fabulous look this season",
    "Occasions: Womens oversized sweater is suitable for casual, daily life, school, outside, vacation, party, street, shopping, office and other occasions in spring, fall and winter; Loose pullover sweater is the perfect silhouette for any occasion; This sweater also a great Christmas gift for mom, wife, daughter or girlfriend",
    "Oversize cutting sweaters are suitable for most women, size S/M=US 4-10, L/XL=US 12-18; Note: Hand wash recommended with cold water; Machine wash cold gentle cycle. Hang or line dry"],
    price: 32.99,
    inventory: 45,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ugerlov-sweater.jpg"
  ) 

  # p114.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/ugerlov-sweater.jpg"),
  #   filename: "ugerlov-sweater"
  # })   


  #115

  p115 = Product.create!(
    product_name: "Womens Turtleneck Sweaters Long Sleeve Pullover Cable Knit Sweaters Soft Jumper",
    description: "#9,015 in Clothing, Shoes & Jewelry",
    bullets: ["51% Viscose, 28% Polyester, 21% Nylon",
    "Pull On closure",
    "Machine Wash",
    "Material: The womens turtleneck sweater is made of skin-friendly knited material (Lightweight, soft, comfortable and warm)",
    "Size Guide: S=US 4-6, M=US 8-10, L=US 12-14, XL=US 16.",
    "Casual and lovely, this top features Turtleneck , long sleeves with ribbed knit. The slim-fit style and stretchy fabric that perfect to show your body shape!",
    "Suitable for Spring, Fall, Party, Date, Vacation, Daily Wearing, Work, At Home, Shopping. Wear it with skinnies and booties for a put-together look or leggings and sneakers for a casual, comfy look on the go!",
    "Washing Instruction: Machine wash,recommend with a laundry bag, do not bleach, do not iron, hang or line dry."],
    price: 41.99,
    inventory: 36,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/womens-turtleneckl.jpg"
  ) 

  # p115.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/womens-turtleneckl.jpg"),
  #   filename: "turtleneck-sweater"
  # })   


  #116

  p116 = Product.create!(
    product_name: "shermie Women's Cute Heart Pattern Elbow Patchwork Casual Crewneck Knitted Sweaters Pullover",
    description: "#20,372 in Clothing, Shoes & Jewelry",
    bullets: ["100% knitted Acrylic/Polyester",
    "Imported",
    "Hand Wash Only",
    "The material is really comfy not scratchy, comfortable material, sturdy, stylish jumper, soft touch fabric, nice stitching.;Loosed fit and comfortable to wear",
    "Super cute sweater and Heart Pattern Patchwork in elbow. The heart details are very soft. The hearts are kind of sewed on and the edges flap up.",
    "Women sweater crewneck,long sleeve knitted pullover sweater, It's perfect with skinny jeans and booties",
    "Cute heart sweater,comfortable! still a great lightweight winter/fall sweater. Breathable, not itchy at all, looks great with the sleeves rolled up too",
    "Garment Care: Hand Wash Recommended With Cold Water / Do Not Bleach / Hang wash Or Line Dry."],
    price: 26.99,
    inventory: 88,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/shermie-heart-sweater.jpg"
  ) 

  # p116.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/shermie-heart-sweater.jpg"),
  #   filename: "shermie-sweater"
  # })   


  #117

  p117 = Product.create!(
    product_name: "MEROKEETY Women's Winter Long Sleeve Zip Puffer Jacket Pockets Baggy Short Down Coats",
    description: "What a good puffer down coat, not only warm but also cute and trendy! It's suitable to wear in the snow, wind, rain days. The ribbed cuffs are really windproof and warm. There is enough room for a bulky sweater underneath.",
    bullets: ["Full Polyester",
    "Imported",
    "Zipper closure",
    "Machine Wash",
    "Size Guide: XS=US 0-4, S=US 4-6, M=US 8-10, L=US 12-14, Model is 5 feet 6 inches and wears a size XS.",
    "Unique Design: Windproof puffer coat, soft and warm padded, ribbed knit cuffs, full zipper, side zipper pockets for essential storage, stand-up collar, solid color, cropped length, oversized style, winter coat outwear for wintry days.",
    "What a good puffer down coat, not only warm but also cute and trendy! It's suitable to wear in the snow, wind, rain days. The ribbed cuffs are really windproof and warm. There is enough room for a bulky sweater underneath. Thick coat for super cold weather, perfect for running around, getting in and out of cars, waiting for the EL or travel.",
    "Occasion: Great for skiing, snowboarding, outdoor exercise, traveling, shopping, street, holiday, casual wear during the autumn, winter, or early spring. Pair well with sweaters, shirts, dress, jeans, gloves, boots, or sneakers.",
    "Garment Care: Machine wash cold separately on gentle cycle with a laundry bag; Hand wash recommended, using a mild gentle soap, no bleach or dry."],
    price: 79.99,
    inventory: 65,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/puffer-jacket-merokeety.jpg"
  ) 

  # p117.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/puffer-jacket-merokeety.jpg"),
  #   filename: "puffer-merokeety-jacket"
  # })     


  #118

  p118 = Product.create!(
    product_name: "KEOMUD Women's Winter Crop Vest Lightweight Sleeveless Warm Outerwear Puffer Vest Padded Gilet",
    description: "The women's crop puffer vest will be folded and compacted inside of the package when delivered, when it is taken out, the Vest will have wrinkles and the effect is not beautiful, but the vacuum packaging can achieve the effect of dust and moisture-proof.",
    bullets: ["Hand Wash in Cold Water/ Recommend Towel Wipe",
    "Imported",
    "Polyester lining",
    "Zipper closure",
    "Hand Wash Only",
    "Feature - Women winter crop vest, Stand-up Collar, Sleeveless, Adjustable drawstring hem, Full zip",
    "Season - Fashion sleeveless lightweight winter warm padded gilet, perfect for fall, winter and early spring. Basic and versatile puffer vest that will give you a comfy and trendy fit",
    "Occasions - Women sleeveless outerwear puffer vest is perfect for many occasions like hiking, biking, climbing, school, work, shopping, enjoy the warm without being bloated",
    "Pair With - Padded cropped puffer vest for women fits nicely over a long sleeve shirt/thick sweater/hoodie/dresses for a casual look, keep you comfy and warm. Vest jacket is always a trendy style as easy to match with all your outfits",
    "Warm Tips - The women crop puffer vest will be folded and compacted inside of the package when delivery, lightly pat the Vest jacket with your hands and then have it hang under the sun for some hours, it will become puffer again"],
    price: 36.97,
    inventory: 88,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/crop-vest.jpg"
  ) 

  # p118.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/crop-vest.jpg"),
  #   filename: "crop-vest"
  # })     


  #119

  p119 = Product.create!(
    product_name: "Amazon Essentials Women's Casual Crew Socks, 6 Pairs",
    description: "Amazon Essentials is focused on creating affordable, high-quality, and long-lasting everyday clothing you can rely on. Our line of women's apparel includes cashmere sweaters, fleece and down jackets, and more, including plus-size options. Our consistent sizing takes the guesswork out of shopping, and each piece is put to the test to maintain the highest s in quality and comfort.",
    bullets: ["73% Cotton, 19% Polyester, 5% Nylon, 3% Elastane",
    "Imported",
    "Machine Wash",
    "Stock up on this six pair pack of must-have crew-length casual socks",
    "Lightweight, flat knit made with premium ring-spun cotton - great for any kind of shoes",
    "Smooth Toe Seam Construction eliminates bulky seams to reduce abrasion and prevent blisters",
    "Spandex for superior fit and shape retention",
    "Everyday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort",
    "An Amazon Brand"],
    price: 7.70,
    inventory: 66,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/women-amazon-socks.jpg"
  ) 

  # p119.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/women-amazon-socks.jpg"),
  #   filename: "amazon-socks"
  # })  


  #120

  p120 = Product.create!(
    product_name: "Performance Lightweight Crew Training Socks (3 Pair) (Medium, White/Black)",
    description: "#4,134 in Clothing, Shoes & Jewelry",
    bullets: ["58% Cotton, 40% Polyester, 2% Elastane",
    "Imported",
    "Dri-FIT technology helps you stay dry and comfortable.",
    "Reinforced heel and toe for enhanced durability in high-wear areas.",
    "Rib cuffs for a snug, comfortable fit.",
    "Arch support for a secure fit."],
    price: 19.90,
    inventory: 55,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nike-socks.jpg"
  )

  # p120.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/nike-socks.jpg"),
  #   filename: "nike-socks"
  # })  



  #121

  p121 = Product.create!(
    product_name: "Gildan Men's Crew T-Shirts, Multipack, Style G1100",
    description: "Gildan is one of the world's largest vertically integrated manufacturers of apparel and socks. Gildan uses cotton grown in the USA, which represents the best combination of quality and value for Gildan's cotton and cotton blended products. Since 2009, Gildan has proudly displayed the Cotton USA mark, licensed by Cotton Council International, on consumer's product packaging and shipping materials. Gildan's environmental program accomplishes two core objectives: Reduce our environmental impact and preserve the natural resources being used in our manufacturing process. At all operating levels, Gildan is aware of the fact that we operate as a part of a greater unit: The environment in which we live and work.",
    bullets: ["100% Cotton",
    "Imported",
    "Pull On closure",
    "Machine Wash",
    "Soft, breathable cotton",
    "Moisture wicking technology keeps you cool and dry",
    "Tag-free to prevent irritation",
    "Classic length for easy tucking",
    "Durable stitching",
    "Lay-flat collar"],
    price: 18.99,
    inventory: 12,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-crew-pack.jpg"
  ) 


  # p121.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/men-crew-pack.jpg"),
  #   filename: "crew-pack"
  # })    

  #122

  p122 = Product.create!(
    product_name: "Coofandy Men's Hawaiian Floral Shirts Cotton Linen Button Down Tropical Holiday Beach Shirts",
    description: "#301 in Clothing, Shoes & Jewelry",
    bullets: ["100% Cotton",
    "Imported",
    "Button closure",
    "Hand Wash Only",
    "High Quality Fabric --- The mens button down shirts short sleeve made of lightweight and soft cotton fabric, give you comfortable and nature skin feel. If you like to be looser, please choose next size.",
    "Stylish Floral Design --- The men cotton linen shirts designed with print flower style, classic regular fit, turn-up collar, button-down closure and left chest pocket.",
    "Multiple Colors --- The men linen aloha beach shirts with fashion floral prints 4 colors to choose from now, each of which is a unique experience! It is also the best gift for your family members, friends and lover on special days or vacation.",
    "Occasion --- The mens casual cotton shirts is suitable for all occasions especially casual outings, beach and vacation activities. Perfect for spring, summer and autumn , fashion street style, dating, hawaiian, everyday casual wear, beach wear and etc.",
    "Warm Tips --- Washing Max Temperature 40°C. Machine and hand wash are both available for the mens floral hawaiian shirts. Please refer to our size chart carefully before you order."],
    price: 29.99,
    inventory: 50,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/tropical-green-shirt.jpg"
  ) 

  # p122.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/tropical-green-shirt.jpg"),
  #   filename: "hawaiian-floral-shirt"
  # })    


  #123

  p123 = Product.create!(
    product_name: "J.Ver Men's Dress Shirts Solid Long Sleeve Stretch Wrinkle-Free Formal Shirt Business Casual Button Down Shirts",
    description: "#72 in Clothing, Shoes & Jewelry",
    bullets: ["62% Cotton, 35% Polyester, 3% Spandex",
    "Imported",
    "Button closure",
    "【Flex Fabric】The long sleeve dress shirt is made of stretch fabric,makes you move body easier;soft and comfortable with good breathability",
    "【Wrinkle Free】The combination of high-quality fabrics and special technology makes the solid dress shirt not easy to wrinkle, easy to care.The classic spread collar easily matches with a tie or bow tie",
    "【Occasion】Business/Wedding/Party/Dating, whether for formal occasions or daily casual, this mens dress shirt is a perfect choice; it is also an ideal gift for family, lovers and friends",
    "【Size】Our button down shirts are US regular fit tailoring style,a variety of sizes and colors for you to choose,please refer to the size chart to choose the size that suits you",
    "【Customer Service】Any problem about our product, please feel free to contact with us,we will respond and resolve your issues in a timely manner.Look forward to your choice"],
    price: 22.99,
    inventory: 0,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/white-jver-shirt.jpg"
  ) 

  # p123.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/white-jver-shirt.jpg"),
  #   filename: "jver-white-shirt"
  # })  

  #124

  p124 = Product.create!(
    product_name: "Dickies Men's Heavyweight Crew Neck Short Sleeve Tee",
    description: "Hard-working men everywhere will be comfort and comfortable with their time in Dickies' Short sleeve heavyweight heathered crew neck t-shirt. Made of a jersey knit material, this heavyweight cotton blend will remain durable, while designed with cotton comfort. On top of the fabric durability, The taped neck and shoulder seams up the ante on strength for longer wear.",
    bullets: ["100% Cotton",
    "Pull On closure",
    "SUPERIOR COMFORT FIT: Our classic crewneck pocket tee is made of 100% heavyweight, soft jersey-knit cotton. Extra-strong taped shoulder & neck seams for added durability. Tagless labeling eliminates chafing. Long tail looks good tucked or untucked.",
    "STURDY FUNCTIONALITY: This 100% preshrunk cotton shirt features a traditional chest pocket with pencil divider & a spacious fit with a long tail for all kinds of work activity. It's a sturdy, basic t-shirt that can be worn either alone or as an undershirt",
    "CLASSIC FAVORITE: Fans tell us our sturdy, tagless t-shirts are the ones by which all others should be measured. Try one on and see for yourself! You can wear it alone or as an undershirt, in a wide selection of colors & regular or big and tall sizes.",
    "TRUSTED NAME: The world's leading performance workwear brand, Dickies has been making quality workwear & apparel since 1922. All Dickies clothing offers superior craftsmanship & unmatched value to deliver classic style & long-lasting comfort every day.",
    "We make jeans, outerwear, school & work uniforms, sports shirts, kids wear, hats, socks, underwear, boots, gloves, belts, eyewear, backpacks, bags & much more."],
    price: 18.99,
    inventory: 15,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dickies-tee.jpg"
  ) 

  # p124.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dickies-tee.jpg"),
  #   filename: "dickies-tee"
  # })  


  #125

  p125 = Product.create!(
    product_name: "Champion Men's T-Shirt, Classic Cotton Tee, Crewneck Tee, Men's Mid-Weight T-Shirt, Script Logo",
    description: "Here’s a go-to classic cotton tee from Champion®, with Champion® quality built into every detail. This classic crewneck T-shirt is made of traceable, US-grown, ring spun cotton yielding an ultra-soft feel. And it’s constructed with a higher stitch count and reinforced shoulder seams for superb quality. The ribbed crewneck looks great and helps hold the shape, with tonal back neck tape for no-chafe comfort. The iconic script logo emblazoned across the chest celebrates the brand’s athletic heritage. Wear this basic cotton crewneck tee on its own or as a layer, and enjoy its quality for a long, long time.",
    bullets: ["100% Cotton",
    "Imported",
    "Pull On closure",
    "Machine Wash",
    "FEEL-GOOD COTTON TO FEEL GOOD ABOUT - This men's T-shirt is made with traceable, US-grown, ring spun cotton, produced using much less water while yielding an ultra-soft feel.",
    "MADE TO LAST - Higher stitch count and reinforced shoulder seams for superb quality.",
    "COMFORT IN THE DETAILS - Tonal back neck tape for no-chafe comfort.",
    "CLASSIC CREWNECK STYLE - Sturdy ribbed crewneck helps hold the shape at the neck.",
    "COLORS FROM BRIGHT TO BASIC - Buy a bunch to beef up your tee-shirt wardrobe.",
    "QUALITY FABRIC - Champion's short-sleeve crewneck tee is made of mid-weight, 5.5-oz. 100% cotton (granite heather: 60% cotton/40% polyester; oxford gray: 90% cotton/10% polyester).",
    "EASY MACHINE WASHING - Throw in the washer, tumble dry low."],
    price: 13.56,
    inventory: 66,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/champion-shirt.jpg"
  ) 

  # p125.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/champion-shirt.jpg"),
  #   filename: "champion-shirt"
  # })    


  #126

  p126 = Product.create!(
    product_name: "vineyard vines Men's Saltwater 1/4-Zip Pullover",
    description: "We wear Saltwaters nonstop – literally wherever we go, they go. From the office to wearing them as a mens golf pullover 1/4 zip, it’s one of our favorite men’s vineyard vines go-tos. That’s why we want them to be the best. So, we introduced a new, softer fabric, added new colors, and kept the moisture-wicking and wrinkle resistant fabric that you love. This must-have quarter zip sweater pullover has a subtle stripe, our signature whale embroidered logo on the chest, is easy to care for, and makes a great gift for any occasion. Make sure it’s vineyard vines quality. At vineyard vines, we think every day should feel this good! We are family owned and operated since 1998. For over 20 years, we’ve been sharing the gift of the Vineyard with everyone we can. Care Instructions: machine wash.",
    bullets: ["55% Cotton, 45% Polyester",
    "Imported",
    "Zipper closure",
    "Machine Wash",
    "MEN’S 1/4-ZIP PULLOVER – Your favorite vineyard vines men’s pullover sweater, with even more to love. This must-have quarter zip pullover has our signature whale embroidered logo on the chest, is easy to care for, and makes a great gift for any occasion.",
    "NEW, INCREDIBLY SOFT FABRIC – The best just got better. This 1/4-zip pullover for men features our new, incredibly soft fabric with moisture-wicking, wrinkle-resistance and a subtle stripe.",
    "EASY WEAR 1/4-ZIP UP – From the office to dinner and everything in between, we wear Saltwaters nonstop. Pair this men’s ¼ zip sweatshirt with a button-down shirt for a no-brainer, ready for anything outfit. Fits true to size.",
    "MOISTURE WICKING AND WRINKLE RESISTANT – No matter what you’re doing, when you put on this lightweight men’s 1/4-zip sweater, the moisture wicking, wrinkle resistant and ultra-soft fabric will have you looking and feeling great.",
    "LIVE THE GOOD LIFE – At vineyard vines, we think every day should feel this good! We are family owned and operated since 1998. For over 20 years, we’ve been sharing the gift of the Vineyard with everyone we can."],
    price: 32.40,
    inventory: 50,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/vineyard-pullover.jpg"
  ) 

  # p126.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/vineyard-pullover.jpg"),
  #   filename: "vineyard-pullover"
  # })    


  #127

  p127 = Product.create!(
    product_name: "Aelfric Eden Mens Long Sleeve Van Gogh Printed Cable Knit Sweaters Casual Oversized Sweater Pullover",
    description: "#14,799 in Clothing, Shoes & Jewelry",
    bullets: ["99.99% cotton",
    "Imported",
    "Machine Wash or Hand Wash",
    "❤️❤ 【Perfect Cozy Pullover Sweater】: Cotton blend. Soft fabric Our synthetic materials allow air to pass through and contain a hydrophobic, or “water-hating”, quality within the fibers of the material which transport sweat to drier areas away from the skin. so it is warm and comfortable and it also ensures the stable quality of the sweater.",
    "❤️❤ 【Unisex Vintage Graphic Sweater】: This pullover sweater is featured with crew neck, color block, Knitted, long sleeves, sunflowers graphic , vintage printed, drop shoulder, and in causal and loose style.",
    "❤️❤ 【Perfect Match Fashion Clothes】: Comfy, premium material ensures a great fitting lights up ugly Christmas Sweater that you won't want to take off! This women's sweater is perfect to pair with jeans , slim jeans, skirt , leggings, shirts, scarf or other accessories.",
    "❤️❤ 【Streetwear Baggy Sweaters】: This knit sweater pullover is perfect for Spring, Fall, Winter, Party, Date, Casual, Daily Wearing , Work , Vacation,Work, Home, Street-wear and so on.",
    "❤️❤ 【Soft Fall Sweater】: If it not fit you or have any other question about the comfy casual sweater , we can exchange it for free or refund. If you have any problems, please contact us by email first, our customer service will solve your problems as soon as possible."],
    price: 48.99,
    inventory: 48,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/vineyard-pullover.jpg"
  ) 

  # p127.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/vineyard-pullover.jpg"),
  #   filename: "vineyard-pullover"
  # })    


  #128

  p128 = Product.create!(
    product_name: "Kallspin Men's Cashmere Wool Blended Relaxed Fit Sweater Vests Knit V-Neck Sleeveless Sweater",
    description: "#9,462 in Clothing, Shoes & Jewelry",
    bullets: ["30% Wool, 20% Viscose, 20% Polyester, 15% Nylon, 15% Cashmere",
    "Machine Wash",
    "Relax fit. Classical design. Wearing with shirt shows formal for working, and wearing with jeans shows leisure at home and party.",
    "Lightweight and soft. You won’t feel anything unnatural even in dancing.",
    "100% cashmere sweater costs you $100 at least. But Kallspin cashmere blend sweater is only $30+. 30% expenditure brings you 70% enjoyment. Winter isn’t the nightmare anymore.",
    "Best choice for Spring, Autumn and Winter. Provides the finest, most stylish and trendy sleeveless pullover sweater which can perfectly keep you warm.",
    "Machine wash with cold water. Do not bleach, do not iron, please hang dry or tumble dry low."],
    price: 30.99,
    inventory: 8,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kallspin-sweater.jpg"
  ) 

  # p128.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kallspin-sweater.jpg"),
  #   filename: "kallspin-sweater"
  # })    



  #129

  p129 = Product.create!(
    product_name: "Haggar Men's Premium No Iron Khaki Classic Fit Expandable Waist Flat Front Pant Reg. and Big & Tall Sizes",
    description: "STYLE TIPS: These Premium No Iron Khakis are ultra-versatile and are perfect for any occasion. For a more laid back look, pair these classic fit khakis with your favorite crewneck and sneakers. For a more elevated look, consider pairing the khaki's with your favorite Haggar sport coat.",
    bullets: ["61% Cotton, 37% Polyester, 2% Spandex",
    "Imported",
    "Button closure",
    "Machine Wash",
    "PREMIUM NO IRON KHAKI: Eliminate the need to iron with the premium khaki pant from Haggar. Featuring a hidden expandable waistband that stretches up to 3 inches, off seam front pockets, single welt back pockets in a flat front, classic fit silhouette.",
    "MATERIAL: Made of 61% Cotton, 37% Polyester, 2% Elastane for stretch and recovery. The comfort of the stretch is what makes this classic pant your go-to for the office or a formal event.",
    "HIDDEN EXPANDABLE WAISTBAND: The waistband stretches up to 3 inches in the waist for all-day comfort and mobility in your mid-section.",
    "STYLE: The khaki that looks as great as it feels. Stretchable cotton-blend fabric, hidden expandable waistband and permanent crease will keep you looking sharp and comfortable.",
    "NO IRON: Whether you are at the office our out on the weekend the easy care of eliminating the need to iron will make this your favorite casual pant!"],
    price: 55.00,
    inventory: 65,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/haggar-men-pants.jpg"
  ) 

  # p129.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/haggar-men-pants.jpg"),
  #   filename: "haggar-men-pants"
  # })    

  #130

  p130 = Product.create!(
    product_name: "Match Men's Wild Cargo Pants",
    description: "#54 in Clothing, Shoes & Jewelry ",
    bullets: ["100% Cotton",
    "Imported",
    "Featuring hardwearing fabric with side-seam cargo pockets",
    "Zipper closure",
    "Machine Wash",
    "Internal waist & bottoms drawstring tie, belt loops",
    "Zipper fly, multi-pockets (2 front slash, 2 rear button down, 4 roomy side cargos)",
    "Ideal for sports & outdoor recreation wear (paintball, climbing, hiking",
    "Cold machine / hand wash separately",
    "Notice: Belt not included, please buy separately"],
    price: 39.99,
    inventory: 31,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/match-men-cargo-pants.jpg"
  ) 


  # p130.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/match-men-cargo-pants.jpg"),
  #   filename: "match-man-cargo"
  # })    


  #131

  p131 = Product.create!(
    product_name: "Levi's Men's 559 Relaxed Straight Jeans",
    description: "Relaxed, straight fit jeans. Made with +Levi's Flex: Our most advanced stretch technology engineered to deliver maximum flex and optimum comfort.",
    bullets: ["100% Cotton",
    "Imported",
    "Zip fly with button closure closure",
    "Machine wash warm, tumble dry",
    "Sits below waist",
    "Extra room through seat and thigh",
    "Levi's Men's Big and Tall 559 Relaxed Straight Jean, Range, 34W x 38L",
    "The model in the image is and is wearing 44 x 32."],
    price: 48.65,
    inventory: 19,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/levi-men.jpg"
  ) 

  # p131.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/levi-men.jpg"),
  #   filename: "levi-men"
  # })      


  #132

  p132 = Product.create!(
    product_name: "Lee Men's Extreme Motion Straight Fit Tapered Leg Jean",
    description: "Just like our founder, H.D. Lee, our passion is helping can-do people do more. We are committed to designing clothing that conforms to your body, allowing you to move through life freely. We help you chase the things that bring you joy and laughter. The things that make you fearless and hopefully because your passion is what makes you unique. And what moves you, moves us. Move your Lee.",
    bullets: ["97% Cotton, 3% Spandex",
    "Imported",
    "Button closure",
    "Machine Wash",
    "STRAIGHT FIT. With a straight fit through the hip and thigh, these jeans sit just below the waist with an Extreme Flex waistband for natural comfort.",
    "CLASSIC 5-POCKET STYLING. A classic fit jean designed with an authentic five-pocket style. Our bestselling straight fit jean is designed with a timeless five-pocket style, perfect for most occasions.",
    "JEANS FOR ALL. This jean is available in a midweight denim with a wide variety of washes, finishes, and fits. Add a classic denim jean to your everyday rotation or try out a new alternative wash -- there's a pair of Lee jeans to fit every style.",
    "A LIFETIME OF QUALITY. For over 100 years, Lee has produced quality apparel with durability and long-lasting construction in mind. Lee is committed to designing clothing that conforms to your body, allowing you to move through life freely.",
    "SPECIFICATIONS. Zipper fly with button closure, signature label at back waistband, leg opening: 15.75 inches."],
    price: 44.22,
    inventory: 0,
    category_id: 6,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lee-tan-jean.jpg"
  ) 

  # p132.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lee-tan-jean.jpg"),
  #   filename: "lee-tan-jean"
  # })  


  #133

  p133 = Product.create!(
    product_name: "Dunkin' Original Blend Medium Roast Ground Coffee, 30 Ounce",
    description: "Start your day off right with a nice cup of this Dunkin' Donuts Original Blend 30-ounce-canister medium-roast coffee. Wake up to the rich aroma of this medium-roast coffee. Made with 100 percent premium Arabica beans, this roast produces a bold flavor and nice finish. This Dunkin' Donuts Original Blend coffee comes in a 30-ounce canister and can be used for both hot and iced beverages, making it a great option for warm and cold climates. Ground coffee is ready for brewing. Medium roast coffee with Original Blend flavor. 30 oz. can. Caffeinated coffee provides an instant pick-me-up when you take a sip. Made with 100% arabica beans, sourced, and selected worldwide. The product is kosher.",
    bullets: ["Contains 1 - 30 ounce canister of ground coffee",
    "Original Blend is the coffee that made Dunkin' famous, featuring a rich, smooth taste unmatched by others",
    "Medium roast coffee, specially blended and roasted to deliver the same great taste as the brewed Dunkin' coffee available in Dunkin' shops",
    "Pre-ground, ready to brew at home sweet home",
    "Enjoy the great taste of Dunkin’ at home"],
    price: 18.97,
    inventory: 66,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dunkin-coffee.jpg"
  ) 

  # p133.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/dunkin-coffee.jpg"),
  #   filename: "dunkin"
  # }) 


  #134

  p134 = Product.create!(
    product_name: "Two Rivers Coffee Flavored Coffee Pods Compatible with Keurig K Cup Brewers, Assorted Variety Pack Flavored Coffee, 40 Count",
    description: "No need for 40 different boxes just to have variety in your flavored coffees. This Two Rivers Coffee box is the #1 selling Flavored Coffee sampler pack! Just one box, 40 delicious flavored coffees. Choice tastes better.",
    bullets: ["Contains maple, chocolate, cinnamon, Chocolate Vanilla, vanilla, Hazelnut and other flavored coffees. Individual flavor may vary!",
    "This Two Rivers Coffee box is the #1 Selling Flavored Coffee sampler pack! No need for 40 different boxes just to have variety in your flavored coffees. Just one box, 40 delicious flavored coffees. Choice tastes better",
    "Two Rivers Coffee Sampler Packs allows you to enjoy an assortment of beverages without buying so many different boxes. Your Coffee, Tea, Hot Cocoa, Cider, Cappuccino headquarters. Yeah... We got you covered.",
    "Compatible With 2.0 Keurig K-Cup Brewer. People with sensitivity to flavored coffee or caffeine products should avoid drinking all flavored coffees.",
    "Two Rivers Coffee is not affiliated or endorsed by Keurig Dr Pepper. Keurig Dr Pepper, Keurig, K-Cup and Green Mountain are registered trademarks of Keurig Dr Pepper."],
    price: 21.95,
    inventory: 88,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/keurig-coffee.jpg"
  ) 

  # p134.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/keurig-coffee.jpg"),
  #   filename: "keurig-coffee"
  # }) 


  #135

  p135 = Product.create!(
    product_name: "Starbucks K-Cup Coffee Pods—Medium Roast Coffee—Pike Place Roast for Keurig Brewers—100% Arabica—4 boxes (96 pods total)",
    description: "Named for our first store in Seattle’s Pike Place Market, this coffee is served fresh every day in Starbucks cafés around the world. A smooth, well-rounded blend of Latin American beans with subtly rich flavors of cocoa and praline, it’s the perfect brewed coffee—a consistently delicious cup you can really look forward to. Enjoy the spirit of Pike Place in every sip. Pike Place is a registered trademark of The Pike Place Market PDA, used under license. Nestlé uses Starbucks trademarks under license",
    bullets: ["PREMIUM COFFEE IN KEURIG K-CUPS—Starbucks delivers exceptional coffee cup after cup with Pike Place Roast medium roast coffee K-Cups—96 total coffee pods for Keurig coffee makers",
    "STARBUCKS PIKE PLACE ROAST COFFEE—A smooth, well-rounded blend of Latin American coffees with subtly rich notes of cocoa and rich praline, it’s perfect for every day",
    "FRESH TASTE—Starbucks adheres to the highest quality standards—shipping you the same carefully roasted 100% arabica coffee beans we brew in our cafés",
    "MAKE IT YOUR OWN—Whether you like black coffee or adding personal touches of inspiration, like milk, cream, syrup or a variety of other additions, Starbucks is the perfect everyday coffee you can make your own",
    "ETHICALLY SOURCED—Starbucks is committed to 100% ethical coffee sourcing in partnership with Conservation International"],
    price: 55.97,
    inventory: 66,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/starbucks.jpg"
  ) 


  # p135.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/starbucks.jpg"),
  #   filename: "starbucks-coffee"
  # })   


  #136

  p136 = Product.create!(
    product_name: "Welch's Fruit Snacks, Mixed Fruit, Gluten Free, Bulk Pack, 0.9 oz Individual Single Serve Bags 40 Count (Pack of 1)",
    description: "Welch's Fruit Snacks Mixed Fruit. Family farmer owned.80 Calorie pouches. Fruit is our 1st ingredient. Natural & artificial flavors. Made with real fruit. DV per serving: 100% Vitamin C. 25% Vitamins A & E. Fat free. Gluten free. No preservatives.",
    bullets: ["Includes (40) 0.9 oz single serving bags",
    "Delicious fruit snacks where fruit is the 1st Ingredient",
    "100% Vitamin C, 25% Vitamins A&E (DV per serving)",
    "Gluten free, fat free & preservative free",
    "Perfect tasty snack for school lunches, sporting games, the office and more"],
    price: 9.49,
    inventory: 14,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/welch.jpg"
  ) 

  # p136.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/welch.jpg"),
  #   filename: "welch-fruit-snacks"
  # })  


  #137

  p137 = Product.create!(
    product_name: "PopCorners Popped Corn Snacks, 6 Flavor Variety Pack, 1oz Bags (20 Pack)",
    description: "Let’s play truth or dare. We’ll go first. A great bag of PopCorners Popped Corn chips is hard to beat. Our popped-corn chips are combined with sunflower oil, cane sugar, and salt. It’s a sweet and salty experience. It’s balanced enough to eat every day. Trust us. Your taste buds will thank you. So, go ahead. We dare you.",
    bullets: ["20 Pack of 1 oz PopCorners variety snack pack chips: (3) White Cheddar, (4) Kettle Corn, (4) Sea Salt, (3) Spicy Queso, (3) Sweet Chili, (3) Sour Cream & Onion single serve snack chips",
    "Wholesome snacks: popcorner's delicious popped corn snacks are drizzled in sunflower oil with a pinch of sea salt, our chips are never fried. No nuts. Just simple ingredients for better flavor",
    "PopCorners delicious popped corn snacks are never fried",
    "TESTED AND TRUE: Non-GMO Project Verified, Kosher- a good alternative to fruit snacks. All chips are Gluten Free excluding White Cheddar.",
    "Convenient on-the-go snacks great for a busy lifestyle, at work, kids' lunch snacks and much more"],
    price: 17.99,
    inventory: 99,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/popcorners.jpg"
  ) 

  # p137.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/popcorners.jpg"),
  #   filename: "popcorners"
  # })  



  #138

  p138 = Product.create!(
    product_name: "OREO Original, OREO Golden, CHIPS AHOY! & Nutter Butter Cookie Snacks Variety Pack, 56 Snack Packs (2 Cookies Per Pack)",
    description: "Milk’s Favorite Cookie - Chocolate and Golden OREO Sandwich Cookies are the perfect anytime treat. Everyone loves the classic taste of creme sandwiched between two wafer cookies. Put a sweet twist on party favors, goodie jars, gift bags, care packages, and more! - The Crunchy Side of CHIPS AHOY! - Baked until crunchy and made with real chocolate chips, Original CHIPS AHOY! cookies have been a household favorite since 1963. These treats are perfect for on-the-go, the office, parties, or simple sweet snacks. - Peanut Butter Lovers’ Cookie - Made with real peanut butter, these cookies have a crunchy texture and a smooth, creamy filling between two round crispy wafers for a sweet and savory snack. - This bulk variety package contains 56 snack packs: 14 packs each (2 regular size cookies per pack) OREO Chocolate Sandwich Cookies, OREO Golden Sandwich Cookies, CHIPS AHOY! Chocolate Chip Cookies, and round Nutter Butter Sandwich Cookies. - Add this bulk variety package of OREO cookies, CHIPS AHOY! cookies, and Nutter Butter cookies to your cart for sweet treats.",
    bullets: ["This bulk variety package contains 56 snack packs: 14 each of OREO Chocolate Sandwich Cookies, OREO Golden Sandwich Cookies, CHIPS AHOY. Chocolate Chip Cookies, and Nutter Butter Sandwich Cookies (packaging may vary)",
    "These treats are iconic. There’s nothing like cream with chocolate or golden wafer cookies; crunchy chocolate chip cookies; or smooth, creamy peanut butter sandwich cookies",
    "From work to the classroom to lunch, bus trips, gift bags, goodie jars, party favors, and dessert baskets, everything is sweeter with these cookies. You can even add them to your favorite recipes.",
    "Preparing for last-minute parties, movie nights, game days, school lunches, office snacks, and crowds of all sizes (and ages) is quick and simple with individually wrapped snack-sized packs",
    "Each pack contains 2 cookies and has 100 – 120 calories per pack"],
    price: 22.58,
    inventory: 54,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/oreo.jpg"
  ) 


  # p138.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/oreo.jpg"),
  #   filename: "oreos"
  # })  



  #139

  p139 = Product.create!(
    product_name: "Wonderful Pistachios, No Shells, Roasted & Salted Nuts, 24 Ounce Resealable Bag, Good Source of Protein, Gluten Free, On the Go Snack",
    description: "One 24 Ounce Resealable Bag of our Roasted & Salted No Shells Wonderful Pistachios. Wonderful Pistachios have literally come out of their shells. Same delicious taste, but with a little less work for you. Still great for snacking, they’re also a wonderful addition to your culinary creations. Wonderful Pistachios are a smart, healthy choice for folks around the world. Wonderful Pistachios grows all of its pistachios in California’s fertile San Joaquin Valley. The warm days and cool nights work in harmony with the region’s natural soils to create the perfect growing climate. We then carefully tend and harvest each pistachio using the latest in sustainable practices. Nutritious and healthy pistachios are great as part of an overall healthy diet. Pistachios are also a good source of plant-based protein. And in addition to tasting great, a single serving includes about 49 pistachios, enough to satisfy your snacking needs. Note: Contains Tree Nuts (pistachios)",
    bullets: ["SIZE: This 24 ounce re-sealable bag is the perfect snack to have around the house and for on-the-go. Pistachios are gluten free, nutritious, and protein powered.",
    "FLAVOR: Roasted & Salted. While these shelled pistachios have the same delicious taste, they are much less work for you. Additionally, with no shell, these pistachios are perfect for cooking, great for snacking, and a tasty, crunchy salad topper.",
    "CALIFORNIA GROWN: Wonderful Pistachios grows all of its pistachios in California orchards, where we carefully tend and harvest using the latest in sustainable practices.",
    "HEALTHY SNACKING: A good source of protein, pistachios are a healthy addition to any gathering - from party to picnic. They are a healthy choice for snacking on-the-go and around the house. See nutrition information for fat content",
    "Gluten Free, Non-GMO Project Verified, contains tree nuts (pistachios), has 130 mg of phosphorus and 280 mg of potassium per serving, and contains only pistachios and sea salt."],
    price: 15.98,
    inventory: 35,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pistachios.jpg"
  ) 

  # p139.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pistachios.jpg"),
  #   filename: "pistachios"
  # })  


  #140

  p140 = Product.create!(
    product_name: "Orgain Organic Vegan Protein Powder, Creamy Chocolate Fudge - 21g of Plant Based Protein, Low Net Carbs, Non Dairy, Gluten Free, No Sugar Added, Soy Free, Kosher, Non-GMO, 2.03 Lb (Packaging May Vary)",
    description: "Orgain organic creamy chocolate fudge protein powder is a naturally smooth and delicious nourishment drink with 21 grams of organic protein and 7 grams of organic fiber per serving. Each serving is USDA organic, gluten free, kosher, vegan, non-GMO, soy free. No artificial flavors, colors or preservatives. This protein shake powder is great to mix with water or milk post workout or while you're on the go through your busy day. This is great for the entire family, including kids.",
    bullets: ["New look and label, same great product! Includes 1 (2.03 Lb) Orgain Organic Plant Based Protein Powder, Creamy Chocolate Fudge",
    "21 grams of organic plant based protein (pea, brown rice, chia seeds), 2 grams of organic dietary fiber, low net carbs, 0 grams of added sugar, 150 calories per serving",
    "USDA organic, vegan, gluten free, dairy free, lactose free, low net carbs, no added sugar, soy free, kosher, Non GMO, carrageenan free, and no artificial ingredients",
    "Mix with water, milk, or your favorite protein shake recipe for a quick breakfast or snack drink. Use when baking to give your cakes, muffins, brownies, or cookies a protein and energy boost",
    "Ideal for healthy, on the go nutrition for men, women, and kids. These are great for meal replacement, smoothie boosters, muscle recovery, and pre or post workouts"],
    price: 26.99,
    inventory: 66,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/proteim.jpg"
  ) 

  # p140.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/proteim.jpg"),
  #   filename: "orgain-protein"
  # })    


  #141

  p141 = Product.create!(
    product_name: "Nature Nate’s 100% Pure, Raw & Unfiltered Honey; 32oz. Squeeze Bottle; Award-Winning Taste",
    description: "Enjoy Nature Nate’s 100% Pure, Raw & Unfiltered Honey on anything needing a little natural sweetness – morning coffee or tea, oatmeal, granola, or as a better-for-you sweetener in baked goods. Nature Nate's raw & unfiltered honey delivers a promise of the highest quality honey. Through rigorous testing and careful handling, we ensure every bottle of Nature Nate's honey is the highest quality from the inside out: no additives, no preservatives, never pasteurized, pollens intact, crafted for exceptional taste, and no sticky bottles. Our ultimate goal is to leave the world a little better than we found it by fostering happy hives and happy lives, giving of our time and resources from bees to beyond the bottle in communities of need.",
    bullets: ["Nature Nate's 100% Pure, Raw & Unfiltered Honey is a sweetener as nature intended. One ingredient: Honey. All we add is the bottle",
    "Packaged in a 32-oz. bottle, our pure honey pairs nicely with granola, yogurt, coffee, tea, and any food needing a drizzle of natural sweetness. This unfiltered honey contains all the natural benefits of honey straight from the hive and has been tested to ensure it’s clean of pesticides, herbicides, antibiotics and manufactured additives",
    "Our blend is crafted for exceptional taste, granting us an award-winning flavor through ChefsBest",
    "Our honey is raw & unfiltered meaning it is gently warmed for pourability and unfiltered to keep the natural good stuff like pollen intact"],
    price: 10.63,
    inventory: 55,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/honey.jpg"
  ) 

  # p141.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/honey.jpg"),
  #   filename: "honey"
  # })     

  #142
  
  p142 = Product.create!(
    product_name: "Amazon Brand - Happy Belly California Walnuts, Halves and Pieces, 40 Ounce",
    description: "Happy Belly California Walnuts are of the premium Chandler variety, which means they have a large, smooth, and oval shape. Harvested in California’s Central Valley, the Mediterranean-like climate and abundance of rich soil is ideal for growing. We've kept this bag unroasted and unsalted to let the walnuts' rich, sweet flavor stand out. A resealable bag helps ensure maximum freshness, all the way down to the last handful. May contain an occasional nut shell fragment.",
    bullets: ["Happy Belly Walnuts feature a rich, sweet flavor balanced with a hint of bitterness from the edible papery skin",
    "Chandler variety walnut halves and pieces are ideal for baking and snacking",
    "Harvested in California’s Central Valley",
    "One 40-ounce stand-up, resealable bag keeps walnuts fresh",
    "Satisfaction Guarantee: We're proud of our products. If you aren't satisfied, we'll refund you for any reason within a year of purchase. 1-877-485-0384",
    "An Amazon brand"],
    price: 9.94,
    inventory: 10,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/amazon-walnuts.jpg"
  ) 

  # p142.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/amazon-walnuts.jpg"),
  #   filename: "amazon-walnuts"
  # })    


  #143

  p143 = Product.create!(
    product_name: "Daechun(Choi's1), Roasted Seaweed, Gim, Sushi Nori (50 Full Sheets), Resealable, Gold Grade, Product of Korea",
    description: "DAECHUN roasted seaweed is the highest grade seaweed(gim) with natural umami flavor. We procure the raw materials from our suppliers. We have been working with our raw material supplier more than 20 years.
Our roasted seaweed is roasted twice and has a crispy texture. We have a robust food safety management system in place that meets the requirements of our customers. For your information, we put the manufactured and expiration date on the back of the package.",
    bullets: ["PREMIUM RESTAURANT QUALITY : No more buying Sushi. Enjoy and Eat like you are in a Sushi Restaurant. Make your Sushi using our Roasted Seaweed Sheets and your favorite fillings. That’s the perfect way to enjoy a Sushi Night with your family and friends! It is Okay to make a mistake while rolling. It contains 50 sheets, so you still have many chances",
    "KOREAN SEAWEED WITH NATURAL UMAMI FLAVOR : Our Roasted Seaweed Sheets are roasted twice and have a crispy texture. The texture is great for making Kimbap, Sushi, Musubi, and Onigiri. You can try all these recipes with our Roasted Seaweed Sheets that make food taste more umami",
    "EASY TO STORE : Came With Desiccant Sachet & Resealable Bag. In order to have the freshest seaweed, avoiding humidity is very important. Our resealable packaging will keep the seaweed from getting soggy. After opening, you can simply reseal and store in a cool place out of direct sunlight. For the longer shelf life of products, storage in a refrigerator is recommended",
    "HEALTH BENEFITS : Seaweed is a SUPERFOOD with lots of nutritional benefits! Rich in nutrients - protein, fiber, minerals and iodine. Our Roasted Seaweed Sheets are vegan, gluten-free and no artificial preservatives, which can be enjoyed by people of all ages. It is not only healthy food, but it also has low calories",
    "FRESHNESS : DAECHUN seaweed is harvested from the Clean West Sea of Korea. The Freshness of our products is our highest priority. We possess hygienic production lines that can continuously product high quality and fresh seaweed"],
    price: 13.99,
    inventory: 54,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/daechun-seaweed.jpg"
  ) 

  # p143.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/daechun-seaweed.jpg"),
  #   filename: "daechun-seaweed"
  # })    



  #144
  
  p144 = Product.create!(
    product_name: "Albanese World's Best 12 Flavor Gummi Bears, 5lbs of Candy, A Great Easter Gift",
    description: "World’s Best – it’s not just on our bag, it’s at the heart of everything we do. From sourcing the best available ingredients, to making our gummies right here in the USA, we focus on doing things right - from start to finish. And we know that you'll taste the difference. From the first bite, you’ll notice a soft chew that makes our gummies a real treat to eat. Then you’ll be amazed by our fresh fruit flavors, flavors so good you’ll be calling your favorites by their names - Cherry, Pink Grapefruit, Watermelon, Strawberry, Orange, Blue Raspberry, Lime, Grape, Green Apple, Mango, Pineapple, and Lemon. So, while you can spell it gummi bears or gummy bears, remember there is only one way to spell World’s Best – Albanese! Don’t just take our word for it, grab a bag and taste the best for yourself. The Albanese family has been making gummi bears, gummi worms, specialty gummi shapes, individual flavor gummies, and of course our gourmet chocolates right here in the United States for over 30 years. During that time we've focused on creating the perfect gummies and one of a kind chocolates. Once our fans got a taste, they couldn’t get enough. Soon fans were stocking up on their favorite 12 Flavor Gummi Bears and Gummi Worms!  Lucky for you, it’s easier than ever to treat yourself to the World’s Best Albanese Candies. Forget the drive and order online today.",
    bullets: ["12 Flavor Gummi Bears: Fan-favorite gummy bear candy in 12 distinctive fruit flavors offer a soft, delicious chew unlike other gummies; It only takes one bite to taste the difference; Every bag includes 12 fruity flavors",
    "Truly Fruity: 12 flavor assortment includes cherry, pink grapefruit, watermelon, strawberry, orange, blue raspberry, lime, grape, green apple, mango, pineapple and lemon in each bag",
    "Stock Up the Flavor: Sweet, sour, big or small, our allergy-free gummi candy bursts with fresh fruit flavor; Find your new favorite gummy worms, bears, butterflies, peach and apple rings in natural, sour and sugar free options",
    "Allergy Friendly Snack: Peanut free, tree nut free, dairy free, MSG free, gluten free, and with no artificial sweeteners, Albanese gummy candies are an allergen-friendly, fat free, low sodium treat packed with a sweet, fruity flavor",
    "Recipe For Success: For over 30 years Albanese has been making delicious treats with high-quality ingredients in the USA; Taste the difference in our wide selection of gummies, chocolates, nuts, and mixes",
    "Product Note: Exposure to heat or sunlight may lead to melting/damage of product. Hence customers are expected to be available during the product delivery"],
    price: 15.05,
    inventory: 64,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/albanese-gummy.jpg"
  ) 

  # p144.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/albanese-gummy.jpg"),
  #   filename: "albanese-gummy"
  # }) 


  #145
  
  p145 = Product.create!(
    product_name: "HARIBO Gummi Candy, Original Goldbears, 3 lb. Bag",
    description: "From a small sweets company to a global market leader, the HARIBO brand is unique. Started as a humble home kitchen, over the past 100 we have grown to a successful family business. Kids and grown-ups love it so, the happy world of HARIBO!",
    bullets: ["There is no better companion than our original HARIBO Goldbears, loved by old and young alike",
    "Sweet treats in five fruity flavors: Lemon (yellow), Orange (orange), Pineapple (white), Raspberry (red), Strawberry (green)",
    "100 calories per serving. Perfect for sharing snacking, decorating and topping desserts",
    "Kids and grown-ups love it so, the happy world of HARIBO!",
    "HARIBO Original Goldbears Gummi Candy, 3 Pound Bag"],
    price: 10.88,
    inventory: 20,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/haribo-gummy.jpg"
  )

  # p145.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/haribo-gummy.jpg"),
  #   filename: "haribo-gummy"
  # }) 



  #146
  
  p146 = Product.create!(
    product_name: "Kinder Joy Eggs, Sweet Cream and Chocolatey Wafers with Toy Inside, Great for Easter Egg Hunts, 4.2 oz, 6 Eggs",
    description: "Treat + Toy, twice the Joy! Open up the iconic Kinder JOY egg and share a moment of surprise and delight. One side holds a delicious treat: two layers of milky sweet creams, topped with two crispy wafer bites filled with cocoa cream. The other side holds an exciting mystery toy, made to extend the fun of playing beyond the excitement of discovery.",
    bullets: ["TREAT + TOY: Discover the fun of Kinder Joy and enjoy the delicious treat on one side of the egg and a surprise real toy on the other. Great for pantry storage, this pack includes a total of 6 individually wrapped​ Kinder Joy eggs",
    "FLAVORFUL COMBINATION: This tasty treat has two layers of creamy deliciousness—one cocoa and one sweet milky-cream flavored. Plus, there are two crispy, chocolatey-covered wafer bites filled with cocoa cream",
    "LOADS OF FUN: Give your kids the delicious egg treat with a surprise toy inside. Each egg comes with a unique toy inside, with over 100 to discover",
    "SHARE IN THE MOMENT: Inspiring interaction, imagination and creativity, Kinder Joy helps families create happy memories by bringing a world of fun in every egg",
    "EASTER GIFTS FOR KIDS: Add Easter joy to your holiday with an Easter gift for kids that's the perfect Easter basket stuffer"],
    price: 6.48,
    inventory: 35,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kinder-joy.jpg"
  ) 

  # p146.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/kinder-joy.jpg"),
  #   filename: "kinder-joy-egg"
  # })   

  #147
  
  p147 = Product.create!(
    product_name: "HERSHEY'S Milk Chocolate Candy, Gluten Free, 16 oz Gift Bar",
    description: "There's happy, and then there's HERSHEY'S happy. Made of the delectable, creamy milk chocolate that's been a classic for decades, HERSHEY'S milk chocolate bars make life more delicious whether they're enjoyed alone or shared with loved ones. That goes double for giant 1-pound bars with the same amazing taste. This massive candy bar is the perfect treat for countless special and everyday occasions. HERSHEY'S 1-pound milk chocolate candy bars can be used to as Christmas presents, Halloween costume party prizes, Easter basket fillings and Valentine's Day gifts. Keep one on hand for important giving moments and store some in your pantry for convenient snacking when the mood strikes. Show up to movie night with a 1-pound HERSHEY'S bar to share with the whole crowd and perfect the night's snack selection. You can even sweeten up your favorite baked desserts with these chocolates by topping cupcakes, brownies and cookies with a section or two. Everyone is excited when they're reaching for HERSHEY'S milk chocolate, and now you can be too!",
    bullets: ["Contains one (1) 16-ounce HERSHEY'S Milk Chocolate Candy Gift Bar",
    "Bring your gift-giving game to the next level with HERSHEY'S classic milk chocolate in a whopping 1-pound bar",
    "Kosher-certified milk chocolate candy in an impressive 1-pound bar wrapped for lasting freshness with a festive To: and From: line",
    "Perfect for Mother's Day and Father's Day celebrations, weddings, graduations and back to school preparation",
    "Enjoy a giant bar of the classic, creamy HERSHEY'S milk chocolate Christmas, Valentine's Day, Easter and Halloween candy the world has known and loved for decades"],
    price: 11.90,
    inventory: 8,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hershey.jpg"
  )

  # p147.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hershey.jpg"),
  #   filename: "hersheys"
  # })     

  #148

  p148 = Product.create!(
    product_name: "Chocolate Covered Strawberries, Original Love Berries, 12 Count",
    description: "A dozen ways to show you care or wish happy Valentine's day in the most scrumptious possible style. Our giant strawberries are lavishly hand-dipped in premium dark, milk and cupid pink white chocolate in our own kitchen, then decorated with heart sprinkles and chocolate drizzles for a heartfelt gift. All of our dipped strawberries are beautifully packed in our signature gift box with ice packs, then shipped overnight to ensure perfect arrival.",
    bullets: ["A sweet way to send your love for Valentines Day or any occasion. 12 Fresh strawberries are lavishly hand-dipped in premium dark, milk and pink-tinted white chocolate confection, and decorated with drizzles and heart sprinkles.",
    "Product Note: Exposure to heat or sunlight may lead to melting/damage of product. Hence customers are expected to be available during the product delivery",
    "We dip our berries in premium chocolatey confection for an exceptional chocolate-lover's experience",
    "Each berry is hand dipped and decorated in our own kitchena for both culinary artistry and exquisitely decadent taste",
    "Freshness and premium quality",
    "Gift messaging available in checkout",
    "Country string: united-states-of-america",
    "Specialty: vegetarian"],
    price: 36.51,
    inventory: 94,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/strawberry-chocolate.jpg"
  )
  
  # p148.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/strawberry-chocolate.jpg"),
  #   filename: "chocolate-strawberries"
  # })   

  #149

  p149 = Product.create!(
    product_name: "Godivas Belgium Goldmark Assorted chocolate 10.9 OZ",
    description: "Godiva Belgium Goldmark Assorted chocolate 10.9 OZ",
    bullets: ["Country Of Origin: United States",
    "Item Package Weight: 1.1904962148 lb",
    "Item Package Dimension: 5.31cm L x 22.5cm W x 30.99cm H"],
    price: 28.91,
    inventory: 19,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/godiva.jpg"
  )

  # p149.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/godiva.jpg"),
  #   filename: "godiva-chocolates"
  # })    


  #150

  p150 = Product.create!(
    product_name: "POPPI Sparkling Prebiotic Soda w/ Gut Health & Immunity Benefits, Beverages w/ Apple Cider Vinegar, Seltzer Water & Fruit Juice, Low Calorie & Low Sugar Drinks, Fun Favs Variety Pack, 12oz (12 Pack) (Packaging & Flavors May Vary)",
    description: "Make no mistake, soda is delicious. But most are loaded with empty calories and chemicals. So we made a better one! poppi combines fresh fruit juice with the prebiotic powerhouse apple cider vinegar (ACV) to create a modern soda that tastes amazing and helps you maintain a happy gut. Every can is made with 1 tablespoon of ACV and contains less than 20 calories and under 5g of sugar. And, there’s NOTHING artificial, so you can feel good about drinking it. Apple cider vinegar has been known to help boost immunity, aid digestion, support glowing skin, and naturally detoxify. From Texas to your taste buds, with love. Cheers!",
    bullets: ["Contains natural prebiotics from unfiltered Apple Cider Vinegar -- a digestive health powerhouse - to keep your gut happy, your immune system feeling healthy, and your skin glowing. Experience the fun(ctional) side of poppi!",
    "No fake stuff. Ever. Made with fresh fruit, 5g of sugar or less and 20 calories or less per can. Our ACV is in stealth mode, so all you taste is pure poppi flavor. This is the new school of soda!",
    "Have a poppi drink anytime or anywhere. Perfect for everyday, on-the-go refreshment — with a meal or as an afternoon pick me up.",
    "Great alternative to diet soda soft drinks, kombucha, juice, seltzer & flavored water, energy drink, coconut water, tonic water, sports drinks",
    "Verified SHARK TANK brand. Join the poppi movement!"],
    price: 26.99,
    inventory: 89,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/poppi.jpg"
  )

  # p150.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/poppi.jpg"),
  #   filename: "poppi-soda"
  # })    


  #151

  p151 = Product.create!(
    product_name: "Pure Leaf Iced Real Brewed Black Tea, Extra Sweet, 18.5 Fl Oz (Pack of 12)",
    description: "At pure leaf, we believe the best things in life are real and simple. But sometimes, simplicity takes a little more work. Before each pure leaf brew is freshly bottled and sealed, our tea leaves are given a lot of love and attention, resulting in refreshing, leaf brewed tea (not from powder or concentrate).",
    bullets: ["Brewed from real tea leaves picked at their freshest, never from powder or concentrate",
    "No artificial sweeteners or added color",
    "Pure Leaf extra sweet iced tea is reminiscent of a Southern sweet tea",
    "250 calories per bottle",
    "Includes twelve 18.5 ounce bottles"],
    price: 18.00,
    inventory: 45,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pure-leaf.jpg"
  )

  # p151.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pure-leaf.jpg"),
  #   filename: "pure-leaf"
  # })  


  #152

  p152 = Product.create!(
    product_name: "Vita Coco Coconut Water, Pure Organic | Refreshing Coconut Taste | Natural Electrolytes | Vital Nutrients | 16.9 Oz (Pack Of 12)",
    description: "Not so long ago, you had to use a machete if you wanted a sip of pure coconut water. We’ve taken the machete out of the equation, which is good, because those things are dangerous. Now all that’s left is mother nature’s most hydrating, refreshing, vitamin- and mineral-rich nectar. Vita Coco is never made from concentrate. That means we pick, crack, and pack fresh young coconuts directly at the source. After the coconuts are cleaned, the delicate water inside is flash pasteurized (and occasionally mixed with all-natural fruit puree) then poured into a shelf-stable Tetra Pak. The entire process from tree to Pak doesn't exceed 72 hours. We hear the end result is a lot like sticking a straw in a coconut.",
    bullets: ["TASTE OF THE TROPICS | Not long ago you needed a ladder and a machete to get great-tasting coconut water. Now all you have to do is crack open a Vita Coco, the WORLD'S BEST-SELLING coconut water",
    "NATURAL HYDRATION | Refreshing and jam-packed with vitamins, nutrients, and ELECTROLYTES (including MORE POTASSIUM than a banana) — our coconut water helps keep your body properly hydrated",
    "REFRESH YOURSELF | Coconut water is the natural choice for everyday, on-the-go refreshment — DRINK VITA COCO before a gym workout, with a meal, as an afternoon pick me up, or after a night out",
    "FAT-FREE, GLUTEN-FREE, and NON-GMO — and with ONLY 45 calories per serving, Vita Coco is the smart, LOWER CALORIE and LOWER SUGAR alternative to most sodas, sports drinks, and fruit juices",
    "ONE 12-PACK CASE of 16.9 OUNCE BOTTLES | AVAILABLE NOW on Amazon Prime, Subscribe and Save, and Pantry — as well as Prime Now and Amazon Fresh (for those times when HYDRATION can't wait)",
    "Please check expiration dates before consuming product (expiration date can be found on the top of our cartons.)"],
    price: 29.88,
    inventory: 55,
    category_id: 7,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/vita-coco.jpg"
  )

  # p152.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/vita-coco.jpg"),
  #   filename: "vita-coco"
  # })    

  #153

  p153 = Product.create!(
    product_name: "Purina Fancy Feast Grain Free Pate Wet Cat Food Variety Pack, Poultry & Beef Collection - (30) 3 oz. Cans",
    description: "Fill your cat's dish with the savory flavors she loves when you offer her selections from this Purina Fancy Feast Poultry and Beef Classic Pate Collection wet cat food variety pack. Three delicious recipes featuring real, high quality turkey, chicken or beef provide your cat companion with a host of mealtime options, and the smooth, tender texture invites her to happily nibble to her heart's content. Each gourmet wet cat food recipe delivers a flavor filled dining experience your feline friend is sure to appreciate, while the grain free formulas let you feel good about the foods you present to your precious feline. She gets essential vitamins and minerals in every serving, along with the tastes she can't get enough of. Serve up a different entree from this variety pack at every feeding, and watch as she delights in every delectable bite. Let your cat try Purina Fancy Feast wet cat food today, and show her just how much you love her.",
    bullets: ["Thirty (30) 3 oz. Cans - Purina Fancy Feast Grain Free Pate Wet Cat Food Variety Pack, Poultry & Beef Collection",
    "Made with turkey. chicken or beef. Three different recipes for the variety your cat loves",
    "Provides 100 percent complete and balanced nutrition for adult cats. Pleasing pate texture",
    "Essential vitamins and minerals in every serving. Backed by Purina, a trusted leader in pet food",
    "Delicious tastes she's sure to adore. Multi-can variety pack makes it easy to stock your pantry"],
    price: 21.97,
    inventory: 63,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/fancy-feast-cat.jpg"
  )

  # p153.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/fancy-feast-cat.jpg"),
  #   filename: "fancy-feast-cat"
  # })    



  #154

  p154 = Product.create!(
    product_name: "Hill's Science Diet Dry Cat Food, Adult, Chicken Recipe, 7 lb. Bag",
    description: "Your adult cat needs a pet food that supports healthy digestion, shiny fur, lean muscles and a healthy immune system. Hill's Science Diet Adult dry cat food is made with high-quality, easy-to-digest ingredients and is specially formulated to fuel the energy needs of cats during the prime of their life. A cat food made with natural ingredients, Hill's Science Diet Adult provides vitamin E plus omega-3 and omega-6 fatty acids to nourish your cat's skin. Packed with high-quality protein, this premium cat food also helps your grown cat maintain lean muscles. Additionally, this adult dry cat kibble provides your grown cat with essential taurine and balanced minerals to support heart health, bladder function and kidney function.  There’s more to love with the new look of Science Diet. Some of our products also have new names, new kibble shapes & new formulas. Calorie content - 4021 kcal/kg (502 kcal/cup) Hill’s Pet Nutrition’s Mission: To help enrich and lengthen the special relationships between people and their pets. More than 220 veterinarians, food scientists, technicians and Ph.D. nutritionists at Hill's develop all of Hill's pet foods to meet the needs of your pets. Hill’s only accepts ingredients from suppliers whose facilities meet stringent quality standards and who are approved by Hill's. Not only is each ingredient examined to ensure its safety, we also analyze each product's ingredient profile for essential nutrients to ensure your pet gets the stringent, precise formulation they need. Hill’s uses only high-quality ingredients including real chicken, lamb or salmon protein. Hill’s dry pet foods have quality protein as the first ingredient and provide clinically proven antioxidant benefits. Plus, they’re made with natural ingredients (plus vitamins, minerals & amino acids) and never contain artificial colors, flavors, preservatives or chicken by-product meal. Hill’s food, shelter & love program donates food to shelters across the country, providing the proper nutrition that helps pets find their way to loving homes. With every purchase of Science Diet you help feed over 100,000 homeless pets every day, 365 days a year.",
    bullets: ["Adult dry cat food with taurine for heart health, plus balanced minerals for kidney and bladder health",
    "High quality protein to help your adult cat build and maintain lean muscle",
    "Packed with vitamin E plus omega 3S and 6S to give your adult cat healthy skin and fur. Not Recommended For - Kittens and pregnant or nursing cats",
    "Made with natural ingredients",
    "Made in the USA with global ingredients you can trust"],
    price: 30.87,
    inventory: 99,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hill-dry-cat.jpg"
  )


  # p154.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hill-dry-cat.jpg"),
  #   filename: "hill-dry-food"
  # })    


  #155

  p155 = Product.create!(
    product_name: "IAMS PROACTIVE HEALTH Adult Indoor Weight Control & Hairball Care Dry Cat Food with Chicken & Turkey Cat Kibble, 16 lb. Bag",
    description: "Keep your cats at their best with IAMS PROACTIVE HEALTH Adult Indoor Weight & Hairball Care Dry Cat Food with Chicken & Turkey—a chicken-first recipe designed to help reduce hairballs before they start, and to help your indoor cat maintain a healthy weight. Formulated with l-carnitine to help your overweight cat slowly and healthily shed extra weight, this cat kibble is made from high quality proteins like chicken and turkey (chicken is the #1 ingredient) to support your cat’s healthy diet and weight-loss regimen. Plus, with its tailored fiber blend (featuring prebiotics and beet pulp) to help support healthy digestion, it might just be the hairball care your cat needs. If you’re looking for a hairball care cat food that will also help you with your cat’s weight management, get your paws on this—and keep your cat happy, healthy, and ready to pounce with IAMS Indoor Weight & Hairball Care Dry Cat Food.",
    bullets: ["Contains 16 pounds bag of IAMS Proactive health adult indoor weight and hairball care dry cat food with chicken and turkey",
    "Chicken is the No.1 ingredient in this protein-rich cat food to help support strong muscles and to provide healthy energy for play",
    "Formulated with l-carnitine to help your indoor cat lose weight or maintain a healthy weight. Serving size maintenance - 1 1/4 cup. Weight Loss - 1 cup",
    "Proprietary fiber blend with beet pulp helps reduce hairballs before they start—making this the perfect indoor cat food for hairball care",
    "Part of a balanced weight control diet, and an integral component of any basic hairball care for cats",
    "10percent less fat compared to IAMS Healthy adult original with chicken, so your cat can enjoy a high quality protein meal"],
    price: 30.38,
    inventory: 2,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/iams-cat.jpg"
  )


  # p155.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/iams-cat.jpg"),
  #   filename: "iams-dry-food"
  # })    



  #156

  p156 = Product.create!(
    product_name: "MeoHui Cat Toys, 2PCS Retractable Cat Wand Toy and 9PCS Cat Feather Toys Cat Teaser Toy Refills, Interactive Cat Toy Wand Kitten Toys for Indoor Cats to Play Chase Exercise",
    description: "As this is a interactive cat toy, we kindly suggest that supervise your cat when playing this toy all the time, in case they bite the toy. Keep it in a safe place that pets can’t reach it. Never leave your cat alone with this toy, because cats like to chew things like string and soft things.",
    bullets: ["1. EXCITING ENTERTAINMENT FOR CATS: Cats are crazy about chaser games! Combine string and feather into a great cat toys, this cat feather toys is an irresistible lure for cats! Swing the feathers 'lure' will get your cats excited and bring out the 'hunt instinct', making them running and jumping like a wild animal, driving your cats crazy with joy! Even adult cat play like a kitten again!",
    "2. CLASSIC PRACTICAL INTERACTIVE CAT TOY: This cat wand toy will help your Indoor cats to flip, jump, pounce, chase. Great way to get your cats energy out and do more exercise, making your cat be released and happy! Suitable for kittens and cats of all ages and sizes! A great kitten toys to spend some quality time with your feline friend. This is a CLASSIC interactive cat toys for indoor cats, give your fur baby a try!",
    "3. TELESCOPIC FISHING POLE DESIGN: This cat fishing pole toy extends from 15” in to 38.9”. It's very light, flexible, durable and easy to store. The fully extend cat toy wand is long enough( 38.9 in) plus the string (23.6in) which can cover a large space for playing, it can really get your cats exercise. And it's very light so that cat-teasing is no longer a tough job for you. You can even sit on the couch watching TV while teasing cats with this feather cat toys.",
    "4. HIGH QUALITY AND SAFETY: The feathers made from Safe, natural material. The telescopic cat stick toy made of new material with higher elasticity and hardness. Our clasp is easy to open and close for changing feathers. Package includes: 2PCS Cat Wand + 9PCS Feather Worms Refills + 2PCS Extra Strings with Clasp. This feather cat toys can be used for longer periods of time. Good for cat gifts!",
    "5. CONSIDERATIONS: As this is an interactive cat toy, we kindly suggest supervise your cat all the time when playing this toy, in case they bite the string and handle. Never leave your cat alone with this toy, Keep it in a safe place pets can’t reach. For any questions, please feel free to reach us, we will help you."],
    price: 11.58,
    inventory: 55,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cat-feather-toy.jpg"
  )

  # p156.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cat-feather-toy.jpg"),
  #   filename: "feather-cat-toy"
  # })    


  #157

  p157 = Product.create!(
    product_name: "Kalimdor Interactive Cat Feather Toys,Retractable Cat Teaser Toy ，Hanging Interactive cat Toys for Indoor Cats Kitten Play Chase Exercise, Kitten Fun Mental Physical Exercise Kitten Toys (1 Pack)",
    description: "Cats are crazy about chasing games!

Combine string and plush mice into a great cat toy, Cat mouse Toy is a great choice for cats playing chase!

activate a cat's natural hunting instinct to chase. Making them running and jumping like a wild animal!

They are happy and get released! Good for healthy, Especially for indoor cats.

This feather cat toys make a good interactive fun exerciser.in the meantime, it can enhance the relation you and your pet. Your cats will love it after you buy it!",
    bullets: ["【Hanging cat toy】Hang the interactive cat toys for indoor cats on a door frame or handle and watch as it wiggles and flies around when your cat touches it. The built-in small stones will make a rustling sound that will drive your cat crazy.",
    "【Cat toys for indoor cats best sellers】This hanging cat toy combines string and plush to create an irresistible lure for your cat. Add some catnip to bring out their hunting instincts and watch as they run and jump like wild animals.",
    "【Adjustable and durable】The elastic rope of this hanging cat toy extends from 10 inches to 70.8 inches (1.8m) and is made of thick, abrasion-resistant material. Even if your cat bites off the rope, you can still tie it back on for longer life.",
    "【Safe and non-toxic】 Our kitten door frame cat toy is made from 100% non-toxic and safe materials, with a production process that meets safety requirements. However, we recommend not letting your pet play alone and replacing the toy when it becomes broken.",
    "【Risk-free purchase】While not every cat will like this door frame cat toy, young, curious, or active cats will be more excited about it. We offer a 30-day free return policy, so if your pet doesn't like the toy, contact us for a satisfied solution."],
    price: 6.99,
    inventory: 10,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hanging-toy-cat.jpg"
  )

  # p157.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/hanging-toy-cat.jpg"),
  #   filename: "hanging-cat-toy"
  # })    


  #158

  p158 = Product.create!(
    product_name: "Legendog 5Pcs Catnip Toy, Cat Chew Toy Bite Resistant Catnip Toys for Cats,Catnip Filled Cartoon Mice Cat Teething Chew Toy",
    description: "#654 in Pet Supplies ",
    bullets: ["Perfect Gift: The cat chew toy is filled with catnip and we choose the more breathable fabric to allow your cats smell the catnip easily and make your cats be more interested in palying with them.",
    "Bite resistant: Fine suture of this cat toy makes it durable for biting. Don't worry it will be chewed up.",
    "Safe and High Quality Material: More Durable Cotton Linen; Stuffed with Soft PP Cotton and Natural Catnip",
    "Application: Helping reduce your pets' boredom and separation anxiety by killing time with the chew toy and the catnip toys for cats are ideal for cats to play indoor or outdoor.",
    "SERVICE - 100% refund or replace will be supported if not satisfied and just be free to contact us if any questions."],
    price: 8.97,
    inventory: 88,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cat-chew-toy.jpg"
  )

  # p158.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cat-chew-toy.jpg"),
  #   filename: "cat-chew-toy"
  # })    


  #159

  p159 = Product.create!(
    product_name: "Good'n'Fun Triple Flavor Kabobs 48 Ounce, Rawhide Snack For All Dogs",
    description: "Good ‘n’ Fun brand offers a tasty smorgasbord of flavors that dogs love. These delicious chews are made from the finest ingredients, including real beef hide and real chicken, to create truly delightful, long-lasting treats your dog will love. Tails will be wagging for flavor-packed Good ‘n’ Fun Triple Flavor Kabobs, made with a savory combination of five flavors that dogs love most. These delicious chew treats are made from the finest rawhide and pork hide, then wrapped with real, savory chicken, wholesome duck and hearty chicken liver flavor to create a truly delightful, long-lasting rawhide treat your dog will love. A great source of protein, Good ‘n’ Fun Triple Flavor Kabobs are a healthy and delicious way to satisfy your dog’s natural urge to chew. The natural action of chewing also helps reduce tartar buildup and remove plaque. Give your dog one Good ‘n’ Fun Triple Flavor Kabob rawhide chew per day. For supervised consumption only. Select a chew slightly larger than your pet’s mouth. Discard chunks or fragments. Always provide plenty of fresh drinking water and visit your veterinarian regularly.",
    bullets: ["FIVE FLAVORS DOGS LOVE: Made from rawhide and pork hide, then wrapped with real savory chicken, wholesome duck and hearty chicken liver flavor.",
    "LONG-LASTING: Good ‘n’ Fun Triple Flavor Kabobs are truly delightful, long-lasting rawhide treats your dog will love.",
    "GREAT SOURCE OF PROTEIN: Perfect to give your dog every day for a chew full of fun and flavor.", 
    "NATURAL CHEWING ACTION: Promotes clean teeth from the natural action of chewing.", 
    "KABOB SHAPE: Wrapped with premium cuts of real chicken, duck and chicken liver flavor canines crave."],
    price: 33.98,
    inventory: 42,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/good-fun-dog-treat.jpg"
  )

  
  # p159.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/good-fun-dog-treat.jpg"),
  #   filename: "good-fun-dogs"
  # })  


  #160

  p160 = Product.create!(
    product_name: "Milk-Bone Original Dog Treats Biscuits for Large Dogs, 10 Pounds (Packaging May Vary)",
    description: "Make your dog′s life more fun with delicious dog snacks from a brand you can trust. Milk-Bone Original dog biscuits are prepared with care and will give your dog the simple, genuine joy that your dog gives you every day. How? A classic crunch with a wag-worthy taste — now with even MORE meaty taste compared to the Milk-Bone Original biscuits you know and love. Better yet, the crunchy texture of Milk-Bone dog biscuits helps freshen dogs′ breath and reduce tartar build-up, so you can fully enjoy all those sloppy doggie kisses. These tasty dog treats even contain vitamins and minerals — 12, to be exact. So you′ll be almost as happy to give them as your dog is to get them … almost.",
    bullets: ["Contains (1) 10 Pound box of Dog Treats for dogs over 50 Pounds (Packaging may vary)",
    "Wholesome and tasty dog treats — now with even MORE meaty taste compared to the Milk-Bone Original biscuits you know and love",
    "Crunchy texture helps freshen breath and reduce tartar build-up, perfect for sloppy doggie kisses",
    "Vitamins and minerals (twelve to be exact)",
    "Bone-shaped deliciousness that makes dog life more fun"],
    price: 14.23,
    inventory: 64,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/milk-bone-dog.jpg"
  )

  # p160.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/milk-bone-dog.jpg"),
  #   filename: "milk-bone-dogs"
  # })  


  #161

  p161 = Product.create!(
    product_name: "Milk-Bone Soft & Chewy Dog Treats, Beef & Filet Mignon Recipe, 25 Ounces",
    description: "Add more wholesome goodness to your dog’s day with Milk-Bone Soft & Chewy Beef & Filet Mignon Recipe With Chuck Roast dog treats. These delicious, tender dog snacks are made with real beef and fortified with vitamins and minerals—12 to be exact! On top of their irresistibly savory taste, the soft texture of these treats makes them easy for dogs of all sizes to enjoy, whether you feed them whole or break into smaller pieces. And with a 100+ year history of baking our treats with love and high-quality ingredients, you can feel good about filling doglife with a little extra joy. Pick up a bag to get tails wagging.",
    bullets: ["Contains (1) 25-ounce containers of Milk-Bone Soft and Chewy Beef and Filet Mignon Recipe With Chuck Roast dog treats",
    "Soft and chewy dog treats made with real chuck roast",
    "Fortified with 12 vitamins and minerals",
    "Great for dogs of all sizes",
    "Loved since 1908"],
    price: 13.76,
    inventory: 22,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/milk-soft-chewy-dog.jpg"
  )


  # p161.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/milk-soft-chewy-dog.jpg"),
  #   filename: "milk-chew-dogs"
  # })  


  #162

  p162 = Product.create!(
    product_name: "GOOLA Dog Squeaky Toys, Cute Dragon Interactive Plush Stuffed Toy with 5 Squeakers and Crinkle Paper,Pet Rope Chew Toy for Puppy Small Medium Large Breed Dogs",
    description: "GOOLA plush squeaky toy can help to release dogs' extra energy and satisfy their physiological needs and mental stimulation. Unique design brings more interesting games, keep the dogs busy can also solve their anxiety and boredom.",
    bullets: ["Multifunction Brings More Happiness : As a perfect toss, chew, fetch and pull toy, the colorful lovely fire dragon shape satisfied dog's natural hunting instinct. Different ways of playing provide lasting games, keeping their attention at all times, relieve the depression,boredom and anxiety when they are alone.",
    "Sounds keeps the dog focused: Squeaky dog toys will create 2 loud crisp sounds when you squeeze it. Its wings were made of crinkle paper, and its has 5 squeakers in all parts of the body. The sounds attracting pet's attention, making them busy and curious, enjoys a longer game time.",
    "More Interaction: Unique design of pulling limbs, arms and feet pull back and forth through the plush toys body adding in an element of variety. Play dogs favorite tug-of-war to increase the affection between you and your pet.",
    "Durable Safe Material: The chew proof plush toy made of premium natural cotton, two layers of durable fabric for extra toughness, non-toxic and tasteless soft material, which helps dogs clean teeth. It's machine washable.",
    "Lifetime Replacement Guarantee : GOOLA Durable dog toy has a lightweight firedragon shape design,which is perfect for puppy,small,middle and large dogs(Do not recommend for extreme strong bite dogs), and is easy to throw it out and bring the pet into the game. For squeaky problematic toys, just click 'Contact Us' and we will be happy to help you with replacement or refund."],
    price: 13.48,
    inventory: 0,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/goola-dog-toy.jpg"
  )

  # p162.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/goola-dog-toy.jpg"),
  #   filename: "goola-dog-toy"
  # })  


  #163

  p163 = Product.create!(
    product_name: "Best Pet Supplies Crinkle Dog Toy for Small, Medium, and Large Breeds, Cute No Stuffing Duck with Soft Squeaker, Fun for Indoor Puppies and Senior Pups, Plush No Mess Chew and Play",
    description: "Give Your Dog an Active Play Outlet with a Soft Crinkle Paper Dog Toy from Best Pet Supplies We all want to give our dogs a healthy way to play, have fun, and enjoy staying active; especially when it comes to giving them toys that are less messy and stand up to all the biting, chewing, and tugging. That’s why we created these super cute, high-quality Best Pet Supplies Duck-Shaped Dog Toys with built-in squeaker and crinkle paper. These versatile toys for dogs give them multiple ways to play and stay engaged while satisfying their natural behavioral needs. And because there’s no stuffing you don’t have to worry about cleaning up a big mess the moment your dog rips into them. Product Details: Soft Duck Dog Toy Built-In Squeezable Squeaker Crinkle Paper Interior No Stuffing or Fluff Available in 6 Fun Colors Overall Length: 15”",
    bullets: ["Premium Soft Chew Toys for Dogs - These adorable dog crinkle toys no stuffing ducks provide your four-legged best friend with an interactive chew toy that makes noise, keeps them engaged, and is gentler on teeth, gums, and dental health",
    "Cute and Colorful Duck Shape - Shaped like a real duck these dog crinkle toys for small dogs, medium dogs, and every size in between comes in 6 unique colors and provides a more puppy friendly shape that's easy to carry around",
    "No Fluff, No Mess Design - Unlike messy bones, ropes, or other toys for aggressive chewers these dog crinkle toys won't leave behind a mess after they're done playing. They also boast reinforced fabric and stitching to help them hold up to chewing",
    "Active Play, Tossing, and Retrieving - Our cute duck chew toys for dogs can be used for bonding with your puppy, reducing stress or separation anxiety, or simply giving them an active outlet for channeling aggression or intense play"],
    price: 5.99,
    inventory: 18,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/duck-dog-toy.jpg"
  )

  # p163.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/duck-dog-toy.jpg"),
  #   filename: "duck-dog-toy"
  # }) 

  #164

  p164 = Product.create!(
    product_name: "Multipet Plush Dog Toy, Lambchop, 10 inch, White/Tan, Small",
    description: "Multipet now offers Lambchop as a dog toy. Lambchop is 10 tall and this Shari Lewis TV puppet was a classic during the 60's and is now back as a great plush toy that squeaks for your dog.",
    bullets: ["Shari Lewis classic and beloved lamb is adored by dogs",
    "Extra soft plush exterior is great for cuddling",
    "Includes squeaker for playtime fun",
    "10 inch regular size dog toy",
    "Pet should be supervised while playing",
    "You will receive one item"],
    price: 6.19,
    inventory: 88,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lambchop-dog-toy.jpg"
  )

  # p164.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/lambchop-dog-toy.jpg"),
  #   filename: "lambchop-dog-toy"
  # })  

  #165

  p165 = Product.create!(
    product_name: "Dog Chew Toys for Aggressive Chewers, Indestructible Tough Durable Squeaky Interactive Dog Toys, Puppy Teeth Chew Corn Stick Toy for Small Meduium Large Breed",
    description: "Dog toys for large dogs, when dog playing with this toy at the first time or giving the toy to a large dog, we reconmmend to control the playing time with in 15 minutes, after which it can be increased to 20-30 minutes per day.",
    bullets: ["Unique Design: The newly designed corn zigzag-shaped molars can be brushed to pet dog's calculus both horizontally and vertically.",
    "Almost Indestructible: The indestructible dog chew toys Tested and approved by many aggressive chewers. While no dog toy is truly indestructible, but this dog chew toy comes very close.",
    "Healthy Material: This product is made of bite resistant TPR material, which will not be deformed even if dog plays with it for a long time, this product is suitable to small ,medium, and large dogs in any breeds.",
    "Squeaky Dog Toys: this product has a sound function, when the dog bites the toy, the toy will make a sound to attract the dog's attention, increase the dog's interest in playing with this product.", 
    "Satisfactory Service: Our dog chew toys have been strictly tested, please don’t worry the quality of our products. We provide satisfactory after-sales service."],
    price: 15.99,
    inventory: 31,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/corn-dog-toy.jpg"
  )

  # p165.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/corn-dog-toy.jpg"),
  #   filename: "corn-dog-toy"
  # })   

  #166

  p166 = Product.create!(
    product_name: "CESAR Wet Dog Food Classic Loaf in Sauce Beef Recipe, Filet Mignon, Grilled Chicken and Porterhouse Steak Variety Pack,. Easy Peel Trays. 3.5 Ounce (Pack of 24)",
    description: "Dogs with sophisticated palates will enjoy a rich culinary experience with CESAR Canine Cuisine Gourmet Wet Dog Food. With Beef or US Chicken as the #1 ingredient, these irresistible recipes will make your furry friend's mouth water and tail wag. CESAR Canine Cuisine Classic Loaf in Sauce Variety Pack Dog Food delights with a tantalizing texture, and is enhanced with vitamins and minerals for complete and balanced nutrition. Served in convenient trays with no-fuss, peel-away freshness seals, CESAR Adult Dog Food makes mealtime easy. Our gourmet wet dog food also uses ingredients formulated to meet nutritional levels established by the AAFCO dog food nutrient profiles for maintenance.",
    bullets: ["Contains one (1) 24 count case of 3.5 oz. trays of CESAR Wet Dog Food Classic Loaf in Sauce Beef Recipe, Filet Mignon, Grilled Chicken, and Porterhouse Steak Flavors Variety Pack: (6) Beef Recipe, (6) Filet Mignon Flavor, (6) Grilled Chicken Flavor, (6) Porterhouse Steak Flavor",
    "Crafted without grains and with US Chicken or Beef as the no.1 ingredient",
    "CESAR Wet Dog Food is complete and balanced and fortified with vitamins and minerals to help dogs of all sizes, especially small breeds, stay healthy",
    "Made in the USA with the world's finest ingredients, CESAR makes a great meal on its own or as a dog food topper mixed with dry food",
    "This gourmet soft dog food is served in convenient trays with easy, peel-away freshness seals"],
    price: 27.96,
    inventory: 21,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cesar-dog-food.jpg"
  )

  # p166.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/cesar-dog-food.jpg"),
  #   filename: "cesar-dog-food"
  # })   


  #167

  p167 = Product.create!(
    product_name: "Royal Canin Small Breed Adult Dry Dog Food, 14 lb bag",
    description: "With countless dog food options out there that feature formulas focused on ingredients, how do you know what nutrition is right for your pet? No matter how big or small your dog is, Royal Canin has a right-sized diet, made with the precise amount of nutrients needed for every stage of their magnificent life. Your small dog has some big nutritional needs. That’s because small breed dogs have higher energy requirements than big dogs. Not only that, these mini pooches have unique traits, and are pretty picky when it comes to what’s put in their bowl. Royal Canin Small Breed Adult Dry Dog Food is formulated to meet the unique nutritional needs of small dog breeds, as they require higher levels of calories per pound of body weight than large dogs. L-carnitine helps metabolize fat to help your dog maintain a healthy weight. Ideal levels of EPA and DHA support healthy skin and a beautiful, shiny coat. Plus, enhanced palatability helps satisfy even the pickiest eaters. Add a variety in texture with Royal Canin Adult Beauty Wet Dog Food. When your dog reaches their later years, there’s Royal Canin Small Adult 8+ and Small Aging 12+ to help keep them happy and healthy as they age. With over 50 years of scientific research and observation, Royal Canin continues to deliver targeted nutrition to feed every pet’s magnificence. Not satisfied? Then neither are we. Our formulas are 100% satisfaction guaranteed.",
    bullets: ["SMALL BREED DOG FOOD: Royal Canin Small Breed Adult Dry Dog Food is precise nutrition specifically made for small dogs 10 months to 8 years old weighing 9–22 lb",
    "WEIGHT MAINTENANCE: L-carnitine helps maintain a healthy weight, while helping to meet the high energy needs of small dog breeds",
    "SKIN AND COAT HEALTH: Optimal levels of fatty acids like EPA and DHA support skin and a healthy dog coat",
    "SPECIALIZED KIBBLE: Small breed adult dog food has an exclusive kibble design adapted for miniature jaws",
    "GREAT FOR PICKY EATERS: Enhanced palatable dog food satisfies the fussy appetites of small dogs"],
    price: 56.99,
    inventory: 12,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/royal-canin-dog-food.jpg"
  )

  # p167.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/royal-canin-dog-food.jpg"),
  #   filename: "royal-canin-dog-food"
  # })   

  #168

  p168 = Product.create!(
    product_name: "PEDIGREE CHOICE CUTS in Gravy Adult Soft Wet Meaty Dog Food Variety Pack, (18) 3.5 oz. Pouches",
    description: "Dogs love a meaty feast, and PEDIGREE CHOICE CUTS in Gravy Filet Mignon Flavor Adult Wet Dog Food gives them the flavors they crave with the nutrition they need. Made with real ingredients including flavorful morsels of real chicken or beef in delectable gravy sauce, our hearty moist dog food provides the perfect balance of oils and minerals for healthy skin and a glistening coat. Each recipe is 100% complete and balanced for canines, so you know they are getting the most from their wet dog food. Help your dog grow happy and healthy with PEDIGREE CHOICE CUTS Food for Dogs.",
    bullets: ["Contains eighteen (18) 3.5 oz. pouches in PEDIGREE CHOICE CUTS in Gravy Adult Wet Dog Food Variety Pack: (6) Beef, Noodle & Vegetables Flavor in Sauce (6) Grilled Chicken Flavor in Sauce, (6) Filet Mignon Flavor in Gravy",
    "Healthy dog food recipe made with real chicken or beef in gravy for an irresistible taste dogs will love",
    "PEDIGREE CHOICE CUTS adult wet dog food is 100% Complete & Balanced",
    "Mix PEDIGREE Wet Dog Food pouches into their kibble for added flavor",
    "PEDIGREE CHOICE CUTS in Gravy dog food is made with real meat in the USA with the world's finest ingredients",
    "Juicy, meaty bites provide a soft texture for flavor and variety",
    "Add PEDIGREE CHOICE CUTS in Gravy Wet Dog Food to your dog’s diet, and feed the good"],
    price: 15.97,
    inventory: 0,
    category_id: 8,
    photourl: "https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pedigree-dog.jpg"
  )

  # p168.photo.attach({
  #   io: URI.open("https://ameizin-seeds.s3.amazonaws.com/ameizin-seeds/pedigree-dog.jpg"),
  #   filename: "pedigree-dog-food"
  # })   


  puts "Done!"

end