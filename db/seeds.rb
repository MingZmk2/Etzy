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

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!( first_name:'jack', email: 'jack@jack.com', password: 'password')

  User.create!(
    first_name: 'Jeffrey', 
    email: 'jeffrey@gmail.com', 
    password: 'password'
  )

  User.create!(
    first_name: 'Ishtahad', 
    email: 'ishtahad@ahmed.com', 
    password: 'password'
  )

  User.create!(
    first_name: 'Justin',
    email: 'justin@hwang.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Bakugo',
    email: 'bakugo@mha.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Chrollo',
    email: 'chrollo@hxh.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Iverson',
    email: 'iverson@allen.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Halle', 
    email: 'halle@berry.com', 
    password: 'password'
  )

  User.create!(
    first_name: 'Dwayne', 
    email: 'dwayne@wade.com', 
    password: 'password'
  )

  User.create!(
    first_name: 'Lebron',
    email: 'lebron@james.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Satoru',
    email: 'satoru@gojo.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Kyle',
    email: 'kyle@lowry.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Dave',
    email: 'dave@chapelle.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Steve', 
    email: 'steve@martin.com', 
    password: 'password'
  )

  User.create!(
    first_name: 'Damian', 
    email: 'damian@lillard.com', 
    password: 'password'
  )

  User.create!(
    first_name: 'Anfernee',
    email: 'anfernee@simons.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Geto',
    email: 'geto@guru.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Luffy',
    email: 'luffy@monkey.com',
    password: 'password'
  )

  User.create!(
    first_name: 'Hisoka',
    email: 'hisoka@hxh.com',
    password: 'password'
  )


  puts "Creating products..."
  #create products from actual Etsy product listing

  product1 = Product.create!({
    product_name: "Sideboard Formentera",
    seller_id: 4,
    description: "PRODUCT INFO

    Width: 120 cm (47.2 inches)
    Depth: 35 cm 13.8 inches)
    Height: 97 cm (38.2 inches)
    
    Perfect sideboard to create warm, practical and decorative spaces. With six spaces of great storage and two sliding doors of our beautiful lattice inspired by the tradition of Mallorca.
    
    Made of untreated solid pine wood, a very durable and resistant natural material that you can take care of by applying oil, wax or varnish.
    
    MEDITERRANEAN LATTICE
    
    Our star material, without a doubt, are the lattice doors, also called 'fresquera'. It has its origin in the tradition of the old 'fridge' furniture of the Mediterranean, which maintained thanks to its highly functional design, fresh food inside.
    
    Our lattice is made by hand by expert cabinetmakers and artisans from our area. When you take home one of our furniture, you also take a piece of Mediterranean history home.
    
    
    FURNITURE CARE
    
    For the conservation of the natural wood of your furniture we advise you:
    
    Wipe the dust with a soft cloth or cloth.
    Use a very fine sandpaper or eraser for surface stains and small chafing.
    Avoid placing it under direct sun exposure and strong heat sources.
    For optimal protection we recommend using an oil, wax or varnish. With them you can preserve both its original natural appearance and give it your own personal touch.
    
    
    NATURAL WOOD
    
    The origin of our materials is very important to us. Our wood is of sustainable origin, totally natural and of the best quality.
    
    We believe in the soul and warmth of the natural finish, the charm of the solid wood grain and the possibilities it offers.
    
    We want you to fall in love with your furniture and that you yourself give the last personal touch to its finish.
    
    
    SHIPPING TIME
    
    Your furniture will arrive within approximately 12 days. It is the time we need to produce it, package it and make it travel to your home, whenever we can, we will get it a little earlier :)",
    price:"9.89",
    availability:26
  })
  
  product1_pic = File.open('./app/assets/images/product_1.jpeg')
  product1.photo.attach(io:product1_pic, filename: "product_1.jpeg")
  
  product2 = Product.create!({
    product_name: "DIY Terrarium Kit",
    seller_id: 3,
    description: "***Please note, this kit does not include succulents or any live plants


    Bring the outdoors into your home and create your very own charming Moss Terrarium! Bring life to any space by adding a pop of greenery to your desk! Naturely Box's terrariums are easy to assemble and you will have a lot of fun doing so!
    
    Whether it's a treat for yourself or a gift for a friend, we got you covered. Gifts can be shipped directly to the recipient of your choice with a personalized handwritten note. Naturely Box kits are curated to include the highest quality materials and are carefully hand packaged with attention to detail.
    
    The kit includes:
    
    ✿ a variety of naturally preserved moss, ferns and flowers
    ✿ white sand
    ✿ black rocks
    ✿ glass terrarium bowl
    ✿ instructions and moss guidelines
    
    All plants are natural and are preserved to maintain their lure and feel, light and water are not required.
    
    Check us out on Instagram @naturelybox
    
    Reach out to learn more about our team building workshops!
    
    ",
    price:"5.00",
    availability:143
  })
  product2_pic = File.open('./app/assets/images/product_2.jpeg')
  product2.photo.attach(io:product2_pic, filename: "product_2.jpeg")

  product3 = Product.create!({
    product_name: "Ceramic Animal Cup",
    seller_id: 2,
    description: "Ceramic Animal cup/Mug with lid/Ceramic cug/Cat cup/Milk mug/Coffee mug/Snack dish/Cat coaster/Snack dish/Gift for cat lover/Vintage tea cup

    ⭐Super cute Ceramic animal shaped Cup,100% lead free, great for breakfast coffee and milk, or for afternoon tea and dessert.
    
    The mug is made of the underglaze process,it is safe for the environment. The mug has a fun three-dimensional embossed texture of animals.
    
    The mug comes with its own animal lid, which can also be used as a coaster or snack dish.
    
    It can be used in the microwave, oven or dishwasher.
    
    ⭐Size: L 13.6cm x H 8.4cm
    
    ⭐Material: Ceramic
    
    ⭐Shipping: We offer worldwide express delivery and will ship out in 1-3days.
    
    Thanks pretty much for your visting, love you all❤",
    price:"15.99",
    availability:45
  })
  product3_pic = File.open('./app/assets/images/product_3.jpg')
  product3.photo.attach(io:product3_pic, filename: "product_3.jpg")

  product4 = Product.create!({
  product_name: "Japanese tea table",
  seller_id: 5,
  description: "Natural bamboo and rattan tatami square table supports customization.

  Collision between traditional handmade skills and modern trend innovation.
  
  Abandon the colors stained by modern civilization,
  
  Based on natural original ecological materials,
  
  To present itself as it is in order to return to its original nature,
  
  Comply with the desire of nature.
  
  Product parameters: (customization is supported)
  
  Product name: bamboo and rattan square table
  
  Product dimensions: length * width * height: (50/60/70)*(50/60/70)*30cm
  
  Material description: Indonesian bamboo and rattan, table bamboo silk, environmental protection wood wax oil coating (matt transparent)
  Installation instructions: Shipped completely without installation.
  
  Indonesian rattan skeleton
  The skeleton of tea table and chair is a thick Indonesian vine, which is tough and firm, extremely elastic and hand-made.
  
  Bamboo and hemp tabletop
  The table top of the tea table is tightly woven with bamboo at the turn of autumn and summer, which is stable, reliable, tough and durable, while the sitting surface is made of rattan, which is refreshing, comfortable and calm. The tabletop is cross-fixed with hemp rope, which is tough and wear-resistant, and the longer it is, the newer it will be.",
  price:"2.99",
  availability:32
  })
  product4_pic = File.open('./app/assets/images/product_4.jpeg')
  product4.photo.attach(io:product4_pic, filename: "product_4.jpeg")

  product5 = Product.create!({
  product_name: "Juniper Bonsai Tree",
  seller_id: 3,
  description: "✿ 3 to 4 years old & approximately 5ft to 6ft height
  ✿ Traditional style hand crafted glazed ceramic bonsai pot
  ✿ Accent mineral + premium red lava rock top dressing
  ✿ Fertilizer and humidity tray add-ons available
  
  Juniper Procumbens is a dwarf Japanese Juniper with bright green growth that blues slightly as it ages. Technically a shrub, this trained bonsai tree is sought after by houseplant enthusiasts everywhere. Juniper Procumbens is the tree most people picture when thinking of bonsai! Trouble free and easy to care for, Juniper Procumbens 'Nana' is a very popular and well adapted houseplant variety, the perfect beginner bonsai tree.
  
  These bonsai trees have been trained into several essential styles and are now ready for your creative input! Most trees will be 'windswept' as seen in most photos, but can also be 'cascade' or 'upright' and other unique styles. Don't hesitate to make requests in your order notes!
  
  All trees come top dressed with fine decorative gravel (premium red lava rock) and an accent mineral (typically Fossil Rock or Snowflake/Firework Obsidian). Accent minerals are not just beautiful, but they're also useful for checking on soil moisture down below without disturbing the potting media. Fossil Rock is a sedimentary mineral with traces of preserved plants and animals (critters are not necessarily visible). Snowflake and Firework Obsidian are relatively rare forms of volcanic glass that display interesting white to red patterns. They're variations of Obsidian formed when volcanic lava cools more slowly than normal, allowing the formation of needle-shaped cristobalite, a type of quartz crystal. Some collectors believe these minerals have healing, calming, and soothing spiritual properties. Fossil Rock is not pictured above, however it is similar in aesthetic to Obsidian.",
  price:"24.00",
  availability:18
  })
  product5_pic = File.open('./app/assets/images/product_5.jpeg')
  product5.photo.attach(io:product5_pic, filename: "product_5.jpeg")

  product6 = Product.create!({
  product_name: "Backflow Incense Burner",
  seller_id: 2,
  description: "Material : Ceramic+ Wood
  Size : 39Cm Hight
  49Cm Width
  Guanyin lamp Ring Ornaments- Colored Sand Yellow
  Overall 49*12*39 CM
  Guanyin Size : 13.2*7 Cm",
  price:"10.59",
  availability:4,
  })
  product6_pic = File.open('./app/assets/images/product_6.jpeg')
  product6.photo.attach(io:product6_pic, filename: "product_6.jpeg")

  product7 = Product.create!({
  product_name: "Tibetan Bodhi Seed Bracelet",
  seller_id: 4,
  description: "This bracelet is handmade using 100% natural 5mm Bodhi seeds which are delicately carved. The silver charm is inscribed with the Buddhist mantra Om Mani Padme Hum. This is the most commonly recited Buddhist mantra in Tibet, it is believed to heal the body and mind, evoking a sense of peace.

  Size: The bracelet has an adjustable length between 16cm and 22cm .
  
  Weight: 6g.
  
  Bracelet will be dispatched from Ipstones, UK, within 1 working day. If you are purchasing from the USA or Europe and would like the option to track your parcel please select 'add delivery upgrade' at the checkout.",
  price:"12.32",
  availability:88
  })
  product7_pic = File.open('./app/assets/images/product_7.jpeg')
  product7.photo.attach(io:product7_pic, filename: "product_7.jpeg")

  product8 = Product.create!({
  product_name: "Herb Grinder - Buddha Statue Design - 3pc Herb Grinders Herb Cutter Cutting and Grinding Metal Blades 2.5 Inch Travel Size",
  seller_id: 6,
  description: "FAQ: (as shown) means the grinder will be engraved as it appears in the photo. (add custom) means that you would like to alter the design or add text and will message us with instructions. (1 sided) means only the top will be engraved, (2 sided) means both the top and the bottom will be engraved. Please message us with any additional questions.FAQ: (as shown) means the grinder will be engraved as it appears in the photo. (add custom) means that you would like to alter the design or add text and will message us with instructions. (1 sided) means only the top will be engraved, (2 sided) means both the top and the bottom will be engraved. Please message us with any additional questions.FAQ: (as shown) means the grinder will be engraved as it appears in the photo. (add custom) means that you would like to alter the design or add text and will message us with instructions. (1 sided) means only the top will be engraved, (2 sided) means both the top and the bottom will be engraved. Please message us with any additional questions.Our all wood herb flower grinders measure approximately 2.5inch in diameter and 1.8inch tall. Compact but plenty large enough for grinding any herb, tobacco, or spice. Sharp teeth cut and grinder with ease. Strong Neodymium magnets hold it together. Shipped in its own individual cardstock kraft box, perfect for gift giving. Laser engraved on the island of Kauai, Hawaii. Free shipping for all US addresses.",
  price:"5.40",
  availability:63
  })
  product8_pic = File.open('./app/assets/images/product_8.jpeg')
  product8.photo.attach(io:product8_pic, filename: "product_8.jpeg")

  product9 = Product.create!({
  product_name: "Zen Garden Set Bamboo Wood Medium | Meditation Crystals Airplant Home Decor",
  seller_id: 5,
  description: "This Miniature Zen Garden will bring peace, calm and a touch of sparkle to your home, room, or meditation corner.

  The set includes everything you need to create your own Mini Zen Garden. A great gift to yourself or to a loved one.
  
  Ancient Buddhists used Zen Gardens for meditation. A Mini Zen Garden will remind you to take a break, raking patterns in the sand.
  
  Arrange the garden according to your creativity and flow. The crystals amplify energy, the airplant brings life and the Buddha stands for enlightenment.
  
  
  The package contains:
  
  * Bamboo wooden base, 23 cm in diameter.
  
  * Bag of white sand.
  
  * Small bamboo rake.
  
  * Airplant (Tillandsia). This plant does not need soil to grow. Spray once a week with water.
  
  * Candle holder with candle. The candle holder on the pictures is not available anymore, a similar candle holder is included.
  
  * Optional: Buddha statue messing (A, B or C). (A sold out, back soon)
  
  * A few natural smooth stones.
  
  * Sea shells.
  
  * Crystals of your choice.
  Amethyst: Natural tranquilizer. Against stress and tension. Activates spiritual awareness and opens intuition.
  Rock Crystal: Cleanses energy and aura, making vital and clear. Against pain.
  Rose Quartz: Structures thoughts. Creates harmony and love.
  
  The combination of these three crystals is considered the 'Golden Triangle'. Placing the crystals together generates an optimal energy flow in your home.
  
  The items will be packaged securely and individually. The Mini Zen Garden kit comes with instructions and can easily be put together by adding the sand and items to the base. Instructions are included.",
  price:"8.00",
  availability:3
  })
  product9_pic = File.open('./app/assets/images/product_9.jpeg')
  product9.photo.attach(io:product9_pic, filename: "product_9.jpeg")

  product10 = Product.create!({
  product_name: "Colorful Buddha canvas wall art",
  seller_id: 5,
  description: "Colorful Buddha canvas wall art Buddhism print Yoga wall art Zen wall decor Buddha canvas Buddha Painting print Multi panel canvas arrives ready to hang and no additional framing required.

  MATERIALS and PROCESS :
  - Premium 100% Cotton Canvas 350gsm.
  - It is printed with high definition HD quality and the latest technology UV machines.
  - 100% Original Inks.
  - Professionally hand-stretched on a 1inch pinewood frame, no additional framing required.
  - Gallery wrapped canvas.
  - Ready to hang right out of the box. Abstract paintings can be hung on either side.
  - We pack every canvas print with care using specialized cardboard corners, cardboard and film.
  - Personalization available. You can contact us for your special printing requests and custom size.
  - PLEASE NOTE, that this is canvas print so no gold foil or metallic glitter is added here.
  
  SIZING GUIDE:
  Size is shown as WIDTH x HEIGHT in inches and centimeters.
  All our measurements are displayed per entire set, when all panels are combined, without spacing included. Recommended space when hanging your canvas split is 1inch to 2inch between each panel.
  We recommend that you take measurements before buying in order to choose the right size for your interior.
  Pictures for illustration purpose only, please refer to the sizes for your space.
  Send message if you need a custom size.
  Example Size:
  60x40inch | 150x100 cm (3 Panels Set) - means 60x40inch total size | 3 panels - 20x40inch each.",
  price:"4.20",
  availability:12
  })
  product10_pic = File.open('./app/assets/images/product_10.jpeg')
  product10.photo.attach(io:product10_pic, filename: "product_10.jpeg")


  puts "Done!"
end