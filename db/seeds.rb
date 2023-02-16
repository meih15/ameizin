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
  Category.create!(category_name: 'Beauty & Personal Care');
  Category.create!(category_name: 'Books');


  puts "Creating products..."

  #1

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

  #2

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

  #3

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


  #4
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


  #5
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

    #6
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
    inventory: 100,      
    category_id: 1
  )


  #7
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

  # 8

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
    inventory: 100,      
    category_id: 1
  )

  # 9

  Product.create!(
    product_name: "INSIGNIA All-New 24-inch Class F20 Series Smart HD 720p Fire TV (NS-24F201NA23, 2022 Model)",
    bullets: ["720p resolution - View your favorite movies, shows and games in high definition.",
    "Alexa voice control - The Alexa Voice Remote lets you easily control your entertainment, search across apps, switch inputs, and more using just your voice. Press and hold the voice button and ask Alexa to easily find, launch, and control content, and even switch to cable.",
  "Fire TV experience built-in - Watch over 1 Million streaming movies and TV episodes with access to tens of thousands of channels, apps, and Alexa skills.",
"Supports Apple AirPlay - Share videos, photos, music and more from an Apple device to your TV with the touch of a button.",
"Supports HDMI ARC - Sends audio directly from the HDMI jack to a compatible soundbar or AV receiver, removing the need for an extra cable."],
    description: "Access live over-the-air channels and streaming with this 24-inch TV—and control it all with your voice. Ask Alexa to launch apps, search for titles and more. An HD experience in 720p provides crystal clear images. You won’t miss a second with the Insignia NS-24F201NA23 24 inches Class F20 Series LED HD Smart Fire TV.",
    price: 89.99,
    inventory: 200,
    category_id: 1
  )

  #10

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
    inventory: 400,
    category_id: 1
  )

  #11

  Product.create!(
    product_name: "Lenovo 2023 Newest Ideapad 1i Laptop, 14 inch HD Display, Intel Quad-Core Processor, 4GB RAM, 256GB Storage, Wi-Fi 6, Bluetooth, Cloud Grey, Windows 11 Home in S Mode, Bundle with JAWFOAL",
    description: "Laptop, JAWFOAL Accessories",
    bullets: ["【Processor】 Powered by Intel Pentium N5030 Quad-Core Processor (up to 2.4 GHz) for fast and snappy performance. Perfect for running lots of tabs and apps.",
    "【Display】 14inches HD (1366x768) TN 220nits Anti-glare. Crisp images come alive on the 14 inch HD IPS display. Keep your eyes free from strain and watch or work for long sessions.",
  "【Upgraded】4GB RAM smoothly run your applications, as well as multiple programs and browser tabs all at once. 128GB eMMC+128GB MicroSD Card Capacity boots up quickly, get to files faster, and have room for loads of files with the quick solid state drive",
"【All-day Battery life】 Tackle assignments or binge watch your favorite show with up to 10 hours of battery life. All day long. Designed for all-day productivity with extended battery life.",
"【Operating System】 Windows 11 Home in S mode comes with advanced security features built right in, which can protect your rights and interests when you are online."],
    price: 299.99,
    inventory: 400,
    category_id: 1
  )


  # 1

    Product.create!(
    product_name: "Mighty Patch Original from Hero Cosmetics - Hydrocolloid Acne Pimple Patch for Covering Zits and Blemishes, Spot Stickers for Face and Skin, Vegan-friendly and FSA Eligible (36 Count)",
    description: "Works best on whiteheads. Not suitable for cystic acne or blackheads. For external use only. Do not use on open wounds. Consult your doctor if you have sensitive skin or any known skin allergies. Do not use if allergic to pectin or rubber. Stop using and ask a doctor if a rash and/or irritation occurs. Keep out of reach of children. Please send us a message if you have any questions before usage.",
    bullets: ["The Original Award-Winning Acne Patch: Mighty Patch is a hydrocolloid sticker that improves the look of pimples overnight without the popping. Just stick it on, get some sleep, and wake up with clearer-looking skin.",
    "Results in 6-8 Hours: Absorbs pimple gunk thanks to our medical-grade hydrocolloid. Clinically tested, drug-free, and safe for all skin types.",
    "All-Night Adhesion: Strong enough to stay on through a whole night of tossing, turning, and pillow-squishing. Easy to remove in the AM without redness or irritation.",
    "Blends Seamlessly into Skin: The thin sticker with a translucent matte finish keeps your pimple under wraps day or night. You might just forget you’re even wearing it.",
    " Peace-Of-Mind Design: Our hydrocolloid patches are UV sterilized, and allergy tested. Each box comes with 36 medium dots (12 millimeters) on easy-peel perforated sheets."],
    price: 12.99,
    inventory: 99,
    category_id: 2
  )
  # 2
  
  Product.create!(
    product_name: "Paula's Choice Skin Perfecting 2% BHA Liquid Salicylic Acid Exfoliant, Gentle Facial Exfoliator for Blackheads, Large Pores, Wrinkles & Fine Lines, Travel Size, 1 Fluid Ounce - PACKAGING MAY VARY",
    description: "GENTLE NON-ABRASIVE LEAVE-ON",
    bullets: ["GENTLE NON-ABRASIVE LEAVE-ON EXFOLIANT: with 2% BHA (Beta hydroxy acid), to unclog & diminish enlarged pores, exfoliate dead skin cells, smooth wrinkles, and brighten and even out skin tone. Combats redness, wrinkles, aging, enlarged pores, and blackheads. PACKAGING MAY VARY.",
    "Dramatically improves skin's texture for radiant youthful even-toned skin. Beta hydroxy acid (BHA also known as salicylic acid) mimics the natural exfoliation process of younger skin by helping it shed extra layers while unclogging and clearing pores.",
    "HYDRATE, BRIGHTEN & SMOOTH FINE LINES: Our unique, non-abrasive, leave-on exfoliant is gentle enough for daily use on all skin types. Exfoliates dead skin cells while clearing pores for a more even tone, plus it visibly reduces fine lines & wrinkles.",
    "Paula's Choice facial exfoliants are gentler on delicate skin of the face & neck than an abrasive face scrub, which can cause micro-tears. A BHA leave-on exfoliator delivers hydration & can exfoliate directly inside the pore & improve how the pore works.",
    "Paula's Choice Skincare makes products that work. No fragrance, no parabens, no fluff. Just effective, science-backed formulas that target any concern from wrinkles to breakouts."],
    price: 13.00,
    inventory: 20,
    category_id: 2
  )

  # 3

  Product.create!(
    product_name: "COSRX Snail Mucin 96% Power Repairing Essence 3.38 fl.oz, 100ml, Hydrating Serum for Face with Snail Secretion Filtrate for Dark Spots and Fine Lines, Not Tested on Animals, No Parabens, No Sulfates, No Phthalates, Korean Skincare",
    description: "#12 in Beauty & Personal Care",
    bullets: ["The Real Snail Essence: Formulated with 96.3% Snail Secretion Filtrate, this essence repairs and rejuvenates the skin from dryness and aging. It improves skin vitality by reducing dullness and soothing dehydrated skin.",
    "Simple Yet Effective Light-weight Essence: A lightweight essence which fastly absorbs into the skin and gives you a natural and healthy glow. Guarantees long-lasting hydration without heavy feeling on the skin.",
    "Key Ingredient: Snail Secretion Filtrate contains 'Mucin'- an EFFECTIVE ingredient for enhanced moisturization. It instantly soothes damaged skin and delivers moisture deep into your skin. Perfect for dehydrated and damaged skin.",
    "NO Snails are Harmed: Snail Mucin is obtained in a safe and environmentally friendly way in a favorite environment of snails and then processed as a cosmetic material. 100% Natural, Hypoallergenic, Dermatologist-tested.",
    "COSRX Standards: All COSRX products are formulated with skin-friendly ingredients that alleviate irritated skin. Hypoallergenic, Dermatologist tested, Animal Testing-FREE, Parabens-FREE, Sulfates-FREE, Phthalates-FREE. Please inform that the expiration date on the product is written in the South Korean format, which goes by Year/ Month/ Date (YY.MM.DD)"],
    price: 19.95,
    inventory: 5,
    category_id: 2
  )

  # 4
  Product.create!(
    product_name: "Celavi Essence Facial Sheet Face Mask Variety Set Classic Authentic Korean Moisturizing Skincare (12-Packs)",
    description: "Keep your face clean and clear while reversing the signs of aging, balancing your natural skin tone, and infusing it with essential hydration with Celavi Face Mask Sheets infused with powerful antioxidants, natural botanicals, and vital nutrients that nourish and protect your skin while leaving behind beautiful radiance.",
    bullets: ["12 Essence Set Includes - Collagen, Seaweed, Honey, pomegranate, Aloe Vera, Vitamin C, Acai Berry, Tea Tree, Avocado, Ginseng, Cucumber, Charcoal",
    "Made In Korea, Paraben Free, Oil Free, Sulfate Free, Cruelty-Free",
    "A deeply-hydrating, revitalizing skin therapy helps create firmer, healthier, more balanced skin",
    "For dry, oily, or sensitive skin"],
    price: 9.99,
    inventory: 0,
    category_id: 2
  )

  #5
  Product.create!(
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
    category_id: 2
  )

  # 6
  Product.create!(
    product_name: "CeraVe Moisturizing Cream | Body and Face Moisturizer for Dry Skin | Body Cream with Hyaluronic Acid and Ceramides | Normal | Fragrance Free | 19 Oz | Packages May Vary",
    description: "Developed with dermatologists, CeraVe Moisturizing Cream has a unique formula that provides 24-hour hydration and helps restore the protective skin barrier with three essential ceramides (1,3,6-II) and hyaluronic acid. This rich, non-greasy, fast-absorbing formula is ideal for sensitive skin on both the face and body  Featuring our patented MVE Technology to release a steady stream of moisturizing ingredients throughout the day and night.",
    bullets: ["[ HYALURONIC ACID MOISTURIZER ] With hyaluronic acid, ceramides and MVE technology for 24 hour hydration. Rich, velvety texture that leaves skin feeling smooth, it is absorbed quickly for softened skin without greasy, sticky, feel.",
    "[ ESSENTIAL CERAMIDES ] Ceramides are found naturally in the skin and make up 50% of the lipids in the skin barrier. All CeraVe products are formulated with three essential ceramides (1, 3, 6-II) to help restore and maintain the skin’s natural barrier.",
    "[ DRY SKIN RELIEF ] A deficiency of ceramides in skin can often be associated with dry skin, which can feel itchy and look flaky. CeraVe Moisturizing Cream was shown to increase the skin's level of ceramides after 4 weeks.",
    "[ DERMATOLOGIST RECOMMENDED ] CeraVe Skincare is developed with dermatologists and has products suitable for dry skin, sensitive skin, oily skin, acne-prone, and more. This skin care product comes with a lid seal",
    "[ GENTLE DAILY MOISTURIZER ] For face and body or can be used as a hand cream for dry skin relief. Holds National Eczema Association (NEA) Seal of Acceptance. Fragrance free, paraben free, allergy-tested, and non-comedogenic."],
    price: 15.48,
    inventory: 99,
    category_id: 2
  )

  #7 
  Product.create!(
    product_name: "Neutrogena Ultra Sheer Dry-Touch Water Resistant and Non-Greasy Sunscreen Lotion with Broad Spectrum SPF 70, 3 Fl Oz (Pack of 1)",
    description: "Neutrogena Ultra Sheer Dry-Touch Sunscreen SPF 70 with Helioplex technology helps prevent damaging UVA rays from penetrating deep under skin's surface.",
    bullets: ["3-fluid ounce bottles of Neutrogena Ultra Sheer Dry-Touch Non-Greasy Sunscreen with SPF 70 that helps defend against the signs of sun and decrease the risk of skin cancer when used as directed",
    "This lightweight sunscreen is fast-absorbing with Dry-Touch technology for a non-greasy, matte finish and is formulated with Helioplex for superior sun protection for your skin",
    "From the dermatologist-recommended suncare brand, this sunscreen is also available in both spray and stick form and can be used at the pool or in the ocean for up to 80 minutes of water-resistance",
    "Sunscreen lotion formula uses Avobenzone for optimal broad-spectrum protection from skin-aging UVA rays and skin-burning UVB rays for both your body and face",
    "Both PABA-free and non-comedogenic, this lightweight sunscreen is suitable for all skin types and provides powerful face and body sun protection without the heavy finish"],
    price: 8.97,
    inventory: 99,
    category_id: 2
  )

  #8

  Product.create!(
    product_name: "Seraphic Skincare Korean Exfoliating Mitts (2pcs) Microdermabrasion at Home Exfoliating Gloves Visibly Lift Away Dead Skin, Great for Spray Tan Removal or Keratosis Pilaris, Made of 100% Viscose Fiber",
    description: "#156 in Beauty & Personal Care",
    bullets: ["Shower Exfoliator for Home Use - Experience Korean spa treatment at home. Our body-exfoliating scrub mitts provide full microdermabrasion to visibly lift away dead skin. Packaging may vary.",
    "Love the Way Your Skin Feels - Our shower mitts give you the smoothest skin ever. When you use our exfoliating body scrubbers 2-4x a month, you’ll enjoy better product absorption, fewer bumps and ingrown hairs, and increased circulation.",
    "Use as a Self-tan Remover - The 100% viscose construction of this microdermabrasion mitt makes it great for buffing out your self tanner without being too harsh. You can also use it to prep your skin before applying tanner.",
    "Way Better than Loofahs or Chemical Exfoliants - Loofahs and chemical exfoliants don’t have the skin-gripping power of our viscose shower exfoliators, meaning they’re not as good at removing dead skin. Our mitts are rough enough to exfoliate deep, while soft enough to buff and smooth.",
    "Reveal a Heavenly Glow - Use our Korean scrub mitts to fight back against dry, bumpy skin caused by keratosis pilaris. Your arms, legs, and body will look smoother and fresher than ever before."],
    price: 9.99,
    inventory: 99,
    category_id: 2
  )

  #9

  Product.create!(
    product_name: "First Aid Beauty KP Bump Eraser Body Scrub Exfoliant for Keratosis Pilaris with 10% AHA 2 oz.",
    description: "#184 in Beauty & Personal Care",
    bullets: ["Exfoliating Body Scrub: Made with chemical and physical exfoliators that sweep away dry, rough bumps to reveal healthier looking skin that feels exceptionally smooth",
    "Reduce Skin Bumps Quickly: Whether you call it “strawberry skin” or “chicken skin,” either way call it gone with this fast-acting KP body scrub that delivers the benefits of a chemical peel and microdermabrasion treatment in one",
    "Buff Away Dead Skin: Glycolic and Lactic Acids at a combined level of 10% help loosen skin’s top layer and decongest pores, while Pumice Buffing Beads (NOT microplastic!) whisk it all away",
    "Free From: Drying Alcohols, Artificial Colorants, Artificial Fragrance, Lanolin, Mineral Oil, Parabens, Petrolatum, Phthalates, Propylene Glycol, Sulfates, Talc, Formaldehydes, Oxybenzone, Coal Tar, Triclocarbon, Ethanol",
    "Dermatologist Tested: Our vegan & cruelty-free exfoliating body scrub is also gluten-free, nut-free, oil-free, soy-free, silicone-free, safe for sensitive skin and nano-free"],
    price: 12.00,
    inventory: 99,
    category_id: 2
  )

  #10

  Product.create!(
    product_name: "Anastasia Beverly Hills - Eyeshadow Palette - Soft Glam",
    description: "Anastasia Beverly Hills Soft Glam Eye Shadow Palette is an essential neutral palette, with 14 shades ranging from warm and cool mattes to glamorous shimmers. Each shade features ABH’s highly pigmented, easy-to-blend formula so you can create seamless neutral eye looks for both day and night.",
    bullets: ["An essential neutral palette that will take you from day to night, featuring 14 shades ranging from warm and cool mattes to glamorous shimmers.",
    "Palette includes 9 ultra-matte and 5 metallic finishes",
    "The full-pigment formula delivers high color payoff and buildable intensity",
    "Includes a dual-ended brush and a large mirror housed inside travel-friendly packaging"],
    price: 45.00,
    inventory: 120,
    category_id: 2
  )

  #11
  Product.create!(
    product_name: "NYX PROFESSIONAL MAKEUP Ultimate Shadow Palette, Eyeshadow Palette - Ultimate Queen",
    description: "We named this collection the Ultimate Shadow Palette because that's exactly what it is-a pro-level palette packed with 16 high-performance eyeshadows and pressed pigments in a rainbow of inspired shades. Available in various striking color combinations - Ultimate Queen, Cool or Warm Neutrals, Bright and Smokey/Highlight - each set features a vivid mix of velvety-rich textures and mesmerizing finishes that range from mattes and satins to shimmers and metallics. .",
    bullets: ["Eyeshadow Palette: This ultimate makeup palette features 16 highly pigmented shadows that glide onto lids and make eyes pop with color; Use with NYX Professional Makeup eyeshadow primer for bolder, longer lasting color",
    "Ultimate Eye Shadow: Each high quality eyeshadow palette features a highly pigmented mix of finishes from matte and satin to shimmery and metallic; perfect for your skin tone; Apply primer and build your look",
    "All Eyes On Eye Makeup: Complete your look with our full range of eye makeup products ranging from eyeshadow palettes to false eyelashes, eyeliners, concealers, setting sprays, eyebrow makeup, eyeshadow primer and more",
    "Cruelty Free Cosmetics: We believe animals belong in our arms, not in a lab; All of our makeup is certified and acknowledged by PETA as a cruelty free brand; We don't test any of our products on animals",
    "Discover NYX Professional Makeup: Try all of our professional makeup products today from eyeshadow, eyeliner, and false lashes to liquid lipstick, lip gloss, primer, concealer, setting sprays and eyebrow makeup"],
    price: 18.00,
    inventory: 0,
    category_id: 2
  )

  #12
   Product.create!(
    product_name: "Wet n Wild MegaGlo Contour Palette, Dulce De Leche | Contouring Powder Face Kit | Flawlessly Sculpted Face",
    description: 'Duo that gives you flawless skin',
    bullets: ["This duo of perfectly complementary contouring powders delivers a flawlessly sculpted face in no time flat",
    "The deeper color defines while the lighter color highlights your best features",
    "This duo of perfectly complementary contouring powders delivers a flawlessly sculpted face in no time flat. The deeper color defines while the lighter color highlights your best features, leaving you at your nofilter best, whatever the occasion."],
    price: 4.28,
    inventory: 20,
    category_id: 2
  )

  #13
  Product.create!(
    product_name: "Mielle Organics Rosemary Mint Scalp & Hair Strengthening Oil With Biotin & Essential Oils, Nourishing Treatment for Split Ends and Dry Scalp for All Hair Types, 2-Fluid Ounces",
    description: "#4 in Beauty & Personal Care",
    bullets: ["NOURISH & STRENGTHEN: Our nutrient-rich, biotin-infused treatment can be used as part of your everyday hair care routine or as an intensive deep treatment to prevent damage for strong, lustrous hair with a fresh, invigorating scent",
    "SMOOTH SPLIT ENDS: This lightweight treatment nourishes split ends and hair follicles for a sleek look; Apply to the ends of hair before you shampoo to soothe and smooth for a healthy, shiny finish that can be air-dried or styled as desired",
    "SOOTHE DRY SCALP: This rich blend of over 30 essential oils and nutrients deeply penetrates the scalp to increase circulation, combat dandruff, and comfort itchy, sensitive skin while working to strengthen, lengthen, nourish, and protect hair",
    "SAFE FOR ALL HAIR TYPES: Our versatile Rosemary Mint Scalp & Hair Strengthening Oil promotes radiant hair for all hair types and deeply nourishes types 3A to 4C, chemically-treated hair, braids, weaves, and both low and high porosity level hair",
    "BY WOMEN FOR WOMEN: Mielle Organics aims to empower women of all hair types and styles with powerful products and gentle, organic ingredients that amplify your natural beauty and are the “root to results” that leave you looking and feeling your best"],
    price: 9.99,
    inventory: 200,
    category_id: 2
  )

  #14
  Product.create!(
    product_name: "ORIGINAL Mimi and Co Spa Headband - Sponge & Terry Towel Cloth Fabric Head Band for Skincare, Face Washing, Makeup Removal, Shower, Facial Mask - Hair Accessories, Padded Headband, Croissant Headband",
    description: "ORIGINAL Mimi and Co Spa Headband - Sponge & Terry Towel Cloth Fabric Head Band for Skincare, Face Washing, Makeup Removal, Shower, Facial Mask - Hair Accessories, Padded Headband, Croissant Headband",
    bullets: ["Extra Absorbent - Thanks to their sponge-covered terry cloth make, these skincare headbands are highly absorbent and can soak up moisture as you wash your face or apply your skincare creams and serums.",
    "One Size Fits All - Size doesn’t matter when it comes to our head bands. Each face washing headband is highly flexible and stretchable so it can be worn by almost anyone - men and women alike!",
    "Adorable Design - Look cute even while washing your face! Aside from making your skincare routine easier, this self care headband sports a charming baby pink color and an easy-to-wear design",
    "A Versatile Hair Band - Wearing this while washing your face is just one way of using it. It may also come in handy for absorbing sweat during yoga or keeping your hair in place while applying makeup.",
    "A Great Self Care Gift - Looking to prepare a self care package for a friend or loved one? Make sure you include this sponge face wash headband! It'll make an great present on any special occasion"],
    price: 6.99,
    inventory: 100,
    category_id: 2
  )

  #15
  Product.create!(
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
    category_id: 2
  )

  #16

  Product.create!(
    product_name: "Maybelline Instant Age Rewind Eraser Dark Circles Treatment Multi-Use Concealer, 110, 1 Count (Packaging May Vary)",
    description: "This dark circle eraser concealer instantly creates a radiant, refreshed looking eye area. Infused with goji berry and Haloxyl. Packaging may vary, what you receive may not be what is reflected on site. â€¢ Instantly erases the appearance of dark circles and fine lines â€¢ Under eye concealer visibly diminishes the appearance of puffiness â€¢ Eye area looks radiant and refreshed â€¢ Anti-aging dark circle treatment contains goji berry and haloxyl to help erase appearance of dark circles and fine lines Step 1. Twist collar of the applicator until the concealer is visible on the sponge (may take some turns on first use). Step 2. Apply concealer to the under-eye area and blend. Step 3. For extreme dark circles, apply the Neutralizer under concealer. Step 4. To add luminosity, apply the Brightener to the inner corner of eyes, cheek, brow bones and bridge of the nose. The Dark Circles Eraser is protected by an anti-microbial system. Do not wet applicator. Wipe off excess eye concealer with dry tissue. By MAYBELLINE.",
    bullets: ["Maybelline Instant Age Rewind Concealer: America's Number 1 Concealer; Erase the look of dark circles, correct the appearance of redness and brighten the look of dull skin with Instant Age Rewind Eraser multi-use concealer",
    "Anti-Aging Concealer: Turn back time with this anti-aging under eye treatment concealer infused with Haloxyl; Say bye bye to the look of fine lines, blemishes, redness, and dark circles, and hello to a radiant, well rested, refreshed looking eye area",
    "Best Face Forward: Maybelline has sheer, medium, and full coverage foundation in liquid, stick, and cushion foundation formulas, and a range of concealers, plus face primers, contour, highlighter, and pressed powder to help you create a perfect canvas",
    "Maybelline Has What You Need: To create any look foundation, BB creams, concealers, and highlighters for the perfect canvas, eye shadows, brow pencils, and eyeliners for any eye look and lip products, from showstopping matte lipstick to a natural lip balm",
    "Remove Maybelline Makeup With Micellar Water: Use Garnier Micellar Water as a gentle makeup remover at night, and as a facial cleanser in the morning to prep skin for Maybelline makeup"],
    price: 8.80,
    inventory: 100,
    category_id: 2
  )

  #17
  Product.create!(
    product_name: "e.l.f. Poreless Putty Primer, Silky, Skin-Perfecting, Lightweight, Long Lasting, Smooths, Hydrates, Minimizes Pores, Flawless Base, All-Day Wear, Flawless Finish, Ideal for All Skin Types, 0.74 Fl Oz",
    description: "#116 in Beauty & Personal Care",
    bullets: ["Infused with Squalane for optimal hydration, perfect for all skin types.",
    "Velvety texture glides effortlessly over the skin, smoothing over imperfections for a poreless effect and the ultimate grip on your makeup.",
    "Apply a thin, even amount to moisturized skin prior to makeup application and allow to set for 30 seconds before applying foundation.",
    "Easy to carry and convenient for travel.",
    "Cruelty-free, vegan and 100% free from Phthalates, Parabens, Nonylphenol, Ethoxylates, Triclosan, triclocarban."],
    price: 9.99,
    inventory: 100,
    category_id: 2
  )

  #18
  Product.create!(
    product_name: "e.l.f. Flawless Finish Foundation, Improves Uneven Skin Tone, Lightweight, Medium Coverage & Semi-Matte, Vegan & Cruelty-Free, Buff, 0.68 Fl Oz",
    description: "e.l.f. Flawless Finish Foundation, Improves Uneven Skin Tone, Lightweight, Medium Coverage & Semi-Matte, Vegan & Cruelty-Free, Buff, 0.68 Fl Oz",
    bullets: ["RESTORE & ILLUMINATE: e.l.f. Flawless Finish Foundation is a lightweight liquid foundation that naturally blends into skin (and hydrates while you’re at it) to help improve uneven skin tone and texture. The shade Buff is light with peachy undertones.",
    "ALL-DAY WEAR: This highly blendable and buildable formula goes on smooth as silk, providing medium-to-full coverage and weightless all-day wear. Added perks: it’s oil-free and supercharged with glycerin to hydrate and soften your skin.",
    "SEMI-MATTE FINISH: This oil-free foundation blends into skin for a beautiful semi-matte satin finish that lasts all day long and is perfect for all skin-types.",
    "MORE COVERAGE, MORE GLOW: For sheer coverage mix our Daily Hydration Moisturizer with the foundation, or for added glow, mix our Beautifully Bare Natural Glow Lotion with the foundation.",
    "SKIN-LOVING INGREDIENTS: All e.l.f. products are made from skin-loving ingredients you want, minus the toxins you don’t—all at good-for-you prices. All e.l.f. products are 100% cruelty-free and Vegan."],
    price: 6.00,
    inventory: 100,
    category_id: 2
  )

  #19
  Product.create!(
    product_name: "Physicians Formula Murumuru Butter Bronzer | Bronzer Face Powder Makeup | Dermatologist Approved",
    description: "Ultra-luxurious bronzer, infused with Murumuru Butter, delivers a radiant Brazilian goddess glow. Moisturizing wonder features ultra-refined pearl and soft-focus pigments that smooth skin texture, brighten skin tone and deliver a gorgeous bronze finish. May Contain: Iron Oxides, Red 7 Lake, Titanium Dioxide.",
    bullets: ["WARM ISLAND GLOW - Give your face the radiant goddess glow of the tropics Pick your color and watch your look gently transform as the refined pearls and soft-focus pigments smooth and brighten your skin tone with a subtle shimmer finish",
    "NOURISHING AND MOISTURIZING - Made with a blend of murumuru butter, cupuaçu butter, and tucuma butter from the nutrient-rich Amazon, this makeup is packed with essential fatty acids and pro-vitamins that soften, condition, and moisturize the skin",
    "SMOOTH APPLICATION - Whether you use a makeup brush or even just your fingers, cosmetics from the Murumuru Butter Collection glide on with ease and seamlessly blend into the skin for attractive all-day coverage. Product Form: Pressed Powder",
    "MADE FOR SENSITIVE SKIN - Physicians Formula makeup is specifically formulated with your health and comfort in mind That's why we use high-quality hypoallergenic and natural ingredients, leaving you looking and feeling beautiful from the inside out",
    "CRUELTY-FREE – All Physicians Formula foundations, eye makeup, lipsticks, and other cosmetics are always cruelty-free and never test on animals"],
    price: 10.12,
    inventory: 30,
    category_id: 2
  )

  #20
  Product.create!(
    product_name: "NYX PROFESSIONAL MAKEUP Slim Lip Pencil, Long-Lasting Creamy Lip Liner - Peakaboo Neutral",
    description: "NYX PROFESSIONAL MAKEUP Slim Lip Pencil, Long-Lasting Creamy Lip Liner - Peakaboo Neutral",
    bullets: ["Lip Liner In All Shades: NYX Professional Makeup Slim Lip Pencil natural lip liner pencils come in a variety of dashing shades from auburn to orange and traffic stopping red to line and define your lips",
    "Long Wearing Lip Liner Pencil: This buttery soft, long wearing lip pencil formula goes on easily and resists bleeding; Glide it on for an instant pump to your pout accompanying your favorite NYX Professional Makeup lipsticks and lip glosses",
    "Lip Products for the Perfect Pout: Doll your lips in creamy, long lasting perfection; Try our complete line of lip makeup including liquid lipstick, lip gloss, lip cream, lip liner and butter gloss",
    "Cruelty Free Cosmetics: We believe animals belong in our arms, not in a lab; All of our makeup is certified and acknowledged by PETA as a cruelty free brand; We don't test any of our products on animals",
    "Discover NYX Professional Makeup: Try all of our professional makeup products today from eyeshadow, eyeliner, and false lashes to liquid lipstick, lip gloss, primer, concealer, setting sprays and eyebrow makeup"],
    price: 4.96,
    inventory: 20,
    category_id: 2
  )

  #21
  Product.create!(
    product_name: "Peripera Ink the Velvet Lip Tint | High Pigment Color, Longwear, Weightless, Not Animal Tested, Gluten-Free, Paraben-Free | #017 ROSY NUDE, 0.14 fl oz",
    description: "#329 in Beauty & Personal Care",
    bullets: ["[STAY ALL DAY - BOLD AND LONG LASTING COLORS] Stay a bold lip with our Ink the Velvet Tint! Our tints use a breakthrough formula with high intensity color pigments that naturally stain your lips. The color goes on smooth and will last throughout the day.",
    "[VELVETY SMOOTH FORMULA] We use an adhesive formula with a double layer elastomer that fills in the fine curves of your lips so you can get that emollient and silky finish.",
    "[WEIGHTLESS AND FRESH FINISH] A lightweight layer of color on your lips helps you get through the day without having your lips feel sticky or clumpy. Comfort is key!",
    "[APPLICATOR TIP] Designed with a precision applicator to shape and line your lips for a precise and perfectly applied lip.",
    "[FUN AND FLIRTY COLORS] A collection of colors that fits every complexion. Find your signature color from our wide selection of gorgeous shades!"],
    price: 9.85,
    inventory: 15,
    category_id: 2
  )


  #22
  Product.create!(
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
    category_id: 2
  )


  #23
  Product.create!(
    product_name: "Women's Daisy by Marc Jacobs Eau So Fresh Eau De Toilette Spray, 4.2 Fl Oz",
    description: "Daisy Eau So Fresh by Marc Jacobs for Women Eau De Toilette Spray 4.25 Oz / 125 Ml.",
    bullets: ["Marc Jacobs Daisy Eau So Fresh Eau De Toilette Spray - 125ml/4.25oz",
    "Incredibly fresh & irresistible fragrance for women",
    "Sweet, elegant, sophisticated, feminine & sensual",
    "Perfume begins with fruity notes of grapefruit, raspberry & pear",
    "The heart is enhanced with floral notes of violet, rose, apple blossom & jasmine"],
    price: 72.99,
    inventory: 100,
    category_id: 2
  )

  #24
  Product.create!(
    product_name: "Kenzo FlowerbyKenzo 3.4 oz Eau de Parfum Spray",
    description: "Flower by Kenzo for Women - 3.4 oz EDP Spray",
    bullets: ["EDP Spray", "3.4 oz - Retail", 
      "Introduced in the year 2000, by the design house of Kenzo. Flower is a floral, powdery fragrance with a blend of wild hawthorne, bulgarian rose, parma violet, cassia, hedione, cyclosal, opoponax, white musk and vanilla. It is recommended for casual wear",
    "Ships same day.", "International Shipping Available"],
    price: 66.92,
    inventory: 100,
    category_id: 2
  )


  #25
  Product.create!(
    product_name: "NYX PROFESSIONAL MAKEUP Butter Gloss, Non-Sticky Lip Gloss - Creme Brulee (Natural)",
    description: "Buttery soft and silky smooth, our decadent Butter Gloss is now available in sumptuous shades! Each glossy color delivers sheer to medium coverage that melts onto your lips and is never sticky, leaving your lips soft, supple and kissable.",
    bullets: ["Butter Gloss: Buttery soft and silky smooth, our decadent Butter Gloss is available in a wide variety of sumptuous shades; Each glossy color delivers sheer to medium coverage that melts onto your lips",
    "Kissable Lips: Our best selling Butter Gloss goes on smooth and creamy and is never sticky, leaving your lips soft, supple and kissable; Try all of our delicious shades, from Angel Food Cake to Tiramisu",
    "Lip Products for the Perfect Pout: Doll your lips in creamy, long lasting perfection; Try our complete line of lip makeup including liquid lipstick, lip gloss, lip cream, lip liner and butter gloss",
    "Cruelty Free Cosmetics: We believe animals belong in our arms, not in a lab; All of our makeup is certified and acknowledged by PETA as a cruelty free brand; We don't test any of our products on animals",
    "Discover NYX Professional Makeup: Try all of our professional makeup products today from eyeshadow, eyeliner, and false lashes to liquid lipstick, lip gloss, primer, concealer, setting sprays and eyebrow makeup"],
    price: 4.97,
    inventory: 100,
    category_id: 2
  )

  #26
  Product.create!(
    product_name: "The Dreamer by Versace for Men 3.4 oz Eau de Toilette Spray",
    description: "Design House: Juicy Couture Fragrance Notes: Mandarin Orange, Green Apple, Black Currant, Guava, Rose Petals. Year Introduced: 2013. Add a touch of Hollywood glamour to your daily beauty routine with Couture La Malibu for women. This youthful fragrance from Juicy Couture effortlessly blends citrus and sweet elements together for an unforgettable aroma. Hints of apple, guava, red currant and mandarin are mingled with aquatic notes for a fresh, light fragrance. Designed to capture the carefree spirit of Southern California, this scent is best suited for daytime wear in the spring or summer.",
    bullets: ["Dreamer by Versace for Men 3.4 oz Eau de Toilette Spray: Buy Versace Colognes - Versace, the Dreamer, is an innovative clear and smooth blend between wild and aromatic plants including juniper, mugwort, and tarragon. An essential beginning allowing an almost immediate glimpse of the richness, refinement, highest quality of reach.",
    "Item Condition: 100% authentic, new and unused. The Dreamer by Versace for Men 3.4 oz Eau de Toilette Spray.",
    "Type: Eau De Toilette"],
    price: 34.99,
    inventory: 100,
    category_id: 2
  )

  #27
  Product.create!(
    product_name: "Nautica Voyage Eau De Toilette for Men - Fresh, Romantic, Fruity Scent - Woody, Aquatic Notes of Apple, Water Lotus, Cedarwood, and Musk - Ideal for Day Wear - 3.3 Fl Oz",
    description: "Nautica Voyage Eau De Toilette for Men - Fresh, Romantic, Fruity Scent - Woody, Aquatic Notes of Apple, Water Lotus, Cedarwood, and Musk - Ideal for Day Wear - 3.3 Fl Oz",
    bullets: ["ROMANTIC AND FRUITY: For an active and romantic man who lives by his own rules.",
    "FRESH AND MASCULINE: Fresh and salty sea breeze that carries romantic scents of coastal herbs and woods.",
    "VERSATILE AND LONG-LASTING: Can be worn casually or formally.",
    "NAUTICA FRAGRANCES: Scents that support your curiosity for life, so that you are ready to take on the day, wherever it takes you."],
    price: 18.90,
    inventory: 30,
    category_id: 2
  )

  #28
  Product.create!(
    product_name: "Le Male by Jean Paul Gaultier for Men - 4.2 Ounce EDT Spray, Eau De Toilette Spray",
    description: "#5,507 in Beauty & Personal Care",
    bullets: ["How-to-Use: For long-lasting effects fragrance should be applied to the body’s pulse points",
    "These include the wrist, behind the ear, crease of your arm and knee, and the base of your throat",
    "Pulse points give off more body heat as this is where blood vessels are closest to the skin, therefore continually warming and releasing your fragrance",
    "The package dimension of the product is 8.9cmL x 8.9cmW x 18.1cmH"],
    price: 77.24,
    inventory: 100,
    category_id: 2
  )

  #29
  Product.create!(
    product_name: "Armaf Club De Nuit Intense Man EDT Men New in Box, Black , 3.6 Fl Oz",
    description: "Club de Nuit Intense Man by Armaf is a Woody Spicy fragrance for men. Club de Nuit Intense Man was launched in 2015",
    bullets: ["Top Notes: Bergamot , Lemon , Pineapple , Black Current",
    "Heart Notes: Birch , Jasmine , Rose",
    "Base Notes: Vanilla, AMbergris, Patchouli"],
    price: 60.00,
    inventory: 18,
    category_id: 2
  )

  #30
  Product.create!(
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
    category_id: 2
  )

  #1
  Product.create!(
    product_name: "Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones",
    description: "James Clear is a writer and speaker focused on habits, decision making, and continuous improvement. He is the author of the #1 New York Times bestseller, Atomic Habits. The book has sold over 5 million copies worldwide and has been translated into more than 50 languages. Clear is a regular speaker at Fortune 500 companies and his work has been featured in places like Time magazine, the New York Times, the Wall Street Journal and on CBS This Morning. His popular '3-2-1' email newsletter is sent out each week to more than 1 million subscribers.",
    bullets: ["Atomic Habits will reshape the way you think about progress and success, and give you the tools and strategies you need to transform your habits--whether you are a team looking to win a championship, an organization hoping to redefine an industry, or simply an individual who wishes to quit smoking, lose weight, reduce stress, or achieve any other goal."],
    price: 14.11,
    inventory: 100,
    category_id: 3
  )

  #2
  Product.create!(
    product_name: "Lessons in Chemistry: A Novel",
    description: "Chemist Elizabeth Zott is not your average woman. In fact, Elizabeth Zott would be the first to point out that there is no such thing as an average woman. But it’s the early 1960s and her all-male team at Hastings Research Institute takes a very unscientific view of equality. Except for one: Calvin Evans; the lonely, brilliant, Nobel–prize nominated grudge-holder who falls in love with—of all things—her mind. True chemistry results. 

But like science, life is unpredictable. Which is why a few years later Elizabeth Zott finds herself not only a single mother, but the reluctant star of America’s most beloved cooking show Supper at Six. Elizabeth’s unusual approach to cooking (“combine one tablespoon acetic acid with a pinch of sodium chloride”) proves revolutionary. But as her following grows, not everyone is happy. Because as it turns out, Elizabeth Zott isn’t just teaching women to cook. She’s daring them to change the status quo.  

Laugh-out-loud funny, shrewdly observant, and studded with a dazzling cast of supporting characters, Lessons in Chemistry is as original and vibrant as its protagonist.",
    bullets: ["#1 NEW YORK TIMES BESTSELLER • GOODREADS CHOICE AWARD WINNER • Meet Elizabeth Zott: a “formidable, unapologetic and inspiring” (PARADE) scientist in 1960s California whose career takes a detour when she becomes the unlikely star of a beloved TV cooking show in this novel that is “irresistible, satisfying and full of fuel” (The New York Times Book Review) and “witty, sometimes hilarious...the Catch-22 of early feminism.” (Stephen King, via Twitter)",
    "A BEST BOOK OF THE YEAR: The New York Times, Washington Post, NPR, Oprah Daily, Entertainment Weekly, Newsweek",
    "“The most delightful novel I read this year...fresh and surprising...I laughed out loud!”—Philip Galanes, The New York Times"],
    price: 18.26,
    inventory: 10,
    category_id: 3
  )


  #3
  Product.create!(
    product_name: "It Starts with Us: A Novel (2) (It Ends with Us)",
    description: "Lily and her ex-husband, Ryle, have just settled into a civil coparenting rhythm when she suddenly bumps into her first love, Atlas, again. After nearly two years separated, she is elated that for once, time is on their side, and she immediately says yes when Atlas asks her on a date.

But her excitement is quickly hampered by the knowledge that, though they are no longer married, Ryle is still very much a part of her life—and Atlas Corrigan is the one man he will hate being in his ex-wife and daughter’s life.

Switching between the perspectives of Lily and Atlas, It Starts with Us picks up right where the epilogue for the “gripping, pulse-pounding” (Sarah Pekkanen, author of Perfect Neighbors) bestselling phenomenon It Ends with Us left off. Revealing more about Atlas’s past and following Lily as she embraces a second chance at true love while navigating a jealous ex-husband, it proves that “no one delivers an emotional read like Colleen Hoover” (Anna Todd, New York Times bestselling author).",
    bullets: ["Before It Ends with Us, it started with Atlas. Colleen Hoover tells fan favorite Atlas’s side of the story and shares what comes next in this long-anticipated sequel to the “glorious and touching” (USA TODAY) #1 New York Times bestseller It Ends with Us."],
    price: 10.49,
    inventory: 20,
    category_id: 3
  )


  #4
  Product.create!(
    product_name: "It Ends with Us: A Novel (1)",
    description: "Lily hasn’t always had it easy, but that’s never stopped her from working hard for the life she wants. She’s come a long way from the small town where she grew up—she graduated from college, moved to Boston, and started her own business. And when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lily’s life seems too good to be true.

Ryle is assertive, stubborn, maybe even a little arrogant. He’s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesn’t hurt. Lily can’t get him out of her head. But Ryle’s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his “no dating” rule, she can’t help but wonder what made him that way in the first place.

As questions about her new relationship overwhelm her, so do thoughts of Atlas Corrigan—her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.

An honest, evocative, and tender novel, It Ends with Us is “a glorious and touching read, a forever keeper. The kind of book that gets handed down” (USA TODAY).",
    bullets: ["From the #1 New York Times bestselling author of It Starts with Us and All Your Perfects, a “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” (Anna Todd, New York Times bestselling author) about a workaholic with a too-good-to-be-true romance can’t stop thinking about her first love—soon to be a major motion picture starring Blake Lively and Justin Baldoni."],
    price: 9.99,
    inventory: 35,
    category_id: 3
  )


  #5
   Product.create!(
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
    category_id: 3
  )


  #6
   Product.create!(
    product_name: "Bittersweet",
    description: "Named one of the top ten influencers in the world by LinkedIn, Susan Cain is a renowned speaker and author of the award-winning books Quiet Power, Quiet Journal, and Quiet: The Power of Introverts in a World That Can’t Stop Talking. Translated into more than forty languages, Quiet hasappeared on many best-of lists, spent more than seven years on the New York Times bestseller list, and was named the #1 best book of the year by Fast Company, which also named Cain one of its Most Creative People in Business. Her TED Talk on the power of introverts has been viewed over forty million times.",
    bullets: ["#1 NEW YORK TIMES BESTSELLER • Sadness is your superpower. In her new masterpiece, the author of the bestselling phenomenon Quiet explores the power of the bittersweet personality, revealing a misunderstood side of mental health and creativity while offering a roadmap to facing grief in order to live life to the fullest.",
    "“Bittersweet grabs you by the heart and doesn’t let go.”—BRENÉ BROWN, author of Atlas of the Heart
“Susan Cain has described and validated my existence once again!”—GLENNON DOYLE, author of Untamed
“The perfect cure for toxic positivity.”—ADAM GRANT, author of Think Again",
    "LONGLISTED FOR THE PORCHLIGHT BUSINESS BOOK AWARD • ONE OF THE BEST BOOKS OF THE YEAR: The Wall Street Journal, Mashable"],
    price: 14.34,
    inventory: 100,
    category_id: 3
  ) 


  #7
   Product.create!(
    product_name: "You're My Little Cuddle Bug",
    description: "From Valentine’s Day to Christmas Day and every day in between, the bestselling You’re My Little series is cute as can be—and festive too! Each spread of these chunky board books shows a child and parent pair with adorable illustrations by Natalie Marshall, as well as shaped cut-outs and raised elements. Perfect for cuddling up with your little one, these sweet rhyming stories celebrates a parent’s love for their child.",
    bullets: ["Celebrate your little cuddle bug with this colorful, rhyming interactive board book!",
    "“You’re My Little Cuddle Bug is sure to become one of your family’s favorite books,” says NAPPA Director Elena Epstein. “This charming book will capture your child’s imagination while celebrating love and hugs.”",
    "Celebrate your little cuddle bug with this sweet and colorful rhyming board book! With chunky pages for little hands and die-cut cuddle bugs to add depth and interest, children will love the interactive features alongside the story.",
    "From Valentine’s Day to Christmas Day and every day in between, the bestselling You’re My Little series is cute as can be—and festive too! Each spread of these chunky board books shows a child and parent pair with adorable illustrations by Natalie Marshall, as well as shaped cut-outs and raised elements. Perfect for cuddling up with your little one, these sweet rhyming stories celebrates a parent’s love for their child."],
    price: 7.74,
    inventory: 100,
    category_id: 3
  ) 


  #8
   Product.create!(
    product_name: "I Love You to the Moon and Back",
    description: "Amelia Hepworth lives in London with her family and two elderly sausage dogs. When she is not writing stories, she enjoys spending time with her little boy and daydreaming in the garden. Usually not at the same time.",
    bullets: ["Show a child just how strong your love is every minute of the day! Features a 'To' and 'From' personalization page, making this sweet offering an ideal gift for baby showers, birthdays, and new parents.",
    "The sun rises, and a bear and cub begin their day together. They splash in the water, climb mountains, watch the colorful lights in the shimmering sky, and play with friends. They show their love for each other by touching noses, chasing each other, and, of course, hugging and snuggling before bed. A sweet, gentle rhyme, perfect for sharing with a special little one that also includes a 'To' and 'From' personalization page in the front of the book, making this heartwarming book an ideal gift."],
    price: 4.76,
    inventory: 99,
    category_id: 3
  ) 


  #9
   Product.create!(
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
    category_id: 3
  ) 


  #10
   Product.create!(
    product_name: "The Four Agreements: A Practical Guide to Personal Freedom (A Toltec Wisdom Book)",
    description: "#26 in Books",
    bullets: ["In The Four Agreements, bestselling author don Miguel Ruiz reveals the source of self-limiting beliefs that rob us of joy and create needless suffering. Based on ancient Toltec wisdom, The Four Agreements offer a powerful code of conduct that can rapidly transform our lives to a new experience of freedom, true happiness, and love.",
    'A New York Times bestseller for over a decade',
    "Translated into 46 languages worldwide"],
    price: 7.74,
    inventory: 0,
    category_id: 3
  ) 


  #11
   Product.create!(
    product_name: "The Very Hungry Caterpillar",
    description: "Eric Carle is acclaimed and beloved as the creator of brilliantly illustrated and innovatively designed picture books for very young children. His best-known work, The Very Hungry Caterpillar, has been translated into 70 languages and sold over 55 million copies. Carle illustrated more than seventy books, many best sellers, most of which he also wrote, and more than 170 million copies of his books have sold around the world. In 2003, Carle received the Laura Ingalls Wilder Award (now called the Children’s Literature Legacy Award) for lifetime achievement in children's literature. In 2002, Eric and his wife, Barbara, cofounded The Eric Carle Museum of Picture Book Art (www.carlemuseum.org) in Amherst, Massachusetts, a 40,000-square-foot space dedicated to the celebration of picture books and picture book illustrations from around the world, underscoring the cultural, historical, and artistic significance of picture books and their art form. Eric Carle passed away in May 2021 at the age of 91. His work remains an important influence on artists and illustrators at work today. www.eric-carle.com",
    bullets: ["THE all-time classic picture book, from generation to generation, sold somewhere in the world every 30 seconds! A sturdy and beautiful book to give as a gift for new babies, baby showers, birthdays, and other new beginnings!",
    "THE all-time classic picture book, from generation to generation, sold somewhere in the world every 30 seconds! A sturdy and beautiful book to give as a gift for new babies, baby showers, birthdays, and other new beginnings!"],
    price: 6.56,
    inventory: 0,
    category_id: 3
  ) 


  #12
   Product.create!(
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
    category_id: 3
  ) 


  #13
   Product.create!(
    product_name: "Things We Hide from the Light (Knockemout Series, 2)",
    description: "#23 in Books",
    bullets: ["New York Times and USA Today bestselling author Lucy Score returns to Knockemout, Virginia, following fan-favorite Things We Never Got Over with Knox's brother Nash's story.",
    "Nash Morgan was always known as the good Morgan brother, with a smile and a wink for everyone. But now, this chief of police is recovering from being shot and his Southern charm has been overshadowed by panic attacks and nightmares. He feels like a broody shell of the man he once was. Nash isn't about to let anyone in his life know he's struggling. But his new next-door neighbor, smart and sexy Lina, sees his shadows. As a rule, she's not a fan of physical contact unless she initiates it, but for some reason Nash's touch is different. He feels it too. The physical connection between them is incendiary, grounding him and making her wonder if exploring it is worth the risk.

Too bad Lina's got secrets of her own, and if Nash finds out the real reason she's in town, he'll never forgive her. Besides, she doesn't do relationships. Ever. A hot, short-term fling with a local cop? Absolutely. Sign her up. A relationship with a man who expects her to plant roots? No freaking way. Once she gets what she's after, she has no intention of sticking around. But Knockemout has a way of getting under people's skin. And once Nash decides to make Lina his, he's not about to be dissuaded…even if it means facing the danger that nearly killed him."],
    price: 13.52,
    inventory: 100,
    category_id: 3
  ) 


  #14
   Product.create!(
    product_name: "Tomorrow, and Tomorrow, and Tomorrow: A novel",
    description: "#20 in Books",
    bullets: ["NEW YORK TIMES BEST SELLER •WINNER OF THE GOODREADS CHOICE AWARD • Sam and Sadie—two college friends, often in love, but never lovers—become creative partners in a dazzling and intricately imagined world of video game design, where success brings them fame, joy, tragedy, duplicity, and, ultimately, a kind of immortality. It is a love story, but not one you have read before.",
    "From the best-selling author of The Storied Life of A. J. Fikry: On a bitter-cold day, in the December of his junior year at Harvard, Sam Masur exits a subway car and sees, amid the hordes of people waiting on the platform, Sadie Green. He calls her name. For a moment, she pretends she hasn’t heard him, but then, she turns, and a game begins: a legendary collaboration that will launch them to stardom.",
    "These friends, intimates since childhood, borrow money, beg favors, and, before even graduating college, they have created their first blockbuster, Ichigo. Overnight, the world is theirs. Not even twenty-five years old, Sam and Sadie are brilliant, successful, and rich, but these qualities won’t protect them from their own creative ambitions or the betrayals of their hearts.",
    "Spanning thirty years, from Cambridge, Massachusetts, to Venice Beach, California, and lands in between and far beyond, Gabrielle Zevin’s Tomorrow, and Tomorrow, and Tomorrow examines the multifarious nature of identity, disability, failure, the redemptive possibilities in play, and above all, our need to connect: to be loved and to love."],
    price: 15.49,
    inventory: 20,
    category_id: 3
  ) 


  #15
   Product.create!(
    product_name: "Goodnight Moon",
    description: "#3 in Children's Classics",
    bullets: ["In this classic of children's literature, beloved by generations of readers and listeners, the quiet poetry of the words and the gentle, lulling illustrations combine to make a perfect book for the end of the day.",
    "In a great green room, tucked away in bed, is a little bunny. 'Goodnight room, goodnight moon.' And to all the familiar things in the softly lit room—to the picture of the three little bears sitting on chairs, to the clocks and his socks, to the mittens and the kittens, to everything one by one—the little bunny says goodnight.",
    "One of the most beloved books of all time, Goodnight Moon is a must for every bookshelf. This board book edition is the right size for little hands and is the perfect gift for baby showers, toddler birthday parties, and holidays."],
    price: 5.36,
    inventory: 99,
    category_id: 3
  ) 



  #16
   Product.create!(
    product_name: "How to Win Friends & Influence People",
    description: "#42 in Books",
    bullets: ["You can go after the job you want—and get it!",
    "You can take the job you have—and improve it!",
    "You can take any situation—and make it work for you!",
    "Dale Carnegie’s rock-solid, time-tested advice has carried countless people up the ladder of success in their business and personal lives.",
    "chieve your maximum potential—a must-read for the twenty-first century with more than 15 million copies sold!"],
    price: 10.40,
    inventory: 99,
    category_id: 3
  ) 



  #17
   Product.create!(
    product_name: "Flash Cards: Sight Words",
    description: "#38 in Books",
    bullets: ["Give your child a head start in reading with these colorful, double-sided Sight Words Flash Cards that feature the first 100 words from the Fry List. An essential tool in building reading fluency!",
    "includes 54 cards"],
    price: 2.88,
    inventory: 99,
    category_id: 3
  ) 

  #18 
   Product.create!(
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
    category_id: 3
  ) 



  #  Product.create!(
  #   product_name: "",
  #   description: ,
  #   bullets: ,
  #   price: ,
  #   inventory: ,
  #   category_id:
  # ) 



  puts "Done!"

end