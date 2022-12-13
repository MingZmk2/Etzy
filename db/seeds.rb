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
  
  product1_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_1.jpeg')
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
    price:"5.08",
    availability:143
  })
  product2_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_2.jpeg')
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
  product3_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_3.jpg')
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
  product4_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_4.jpeg')
  product4.photo.attach(io:product4_pic, filename: "product_4.jpeg")

  product5 = Product.create!({
  product_name: "Juniper Bonsai Tree",
  seller_id: 6,
  description: "✿ 3 to 4 years old & approximately 5ft to 6ft height
  ✿ Traditional style hand crafted glazed ceramic bonsai pot
  ✿ Accent mineral + premium red lava rock top dressing
  ✿ Fertilizer and humidity tray add-ons available
  
  Juniper Procumbens is a dwarf Japanese Juniper with bright green growth that blues slightly as it ages. Technically a shrub, this trained bonsai tree is sought after by houseplant enthusiasts everywhere. Juniper Procumbens is the tree most people picture when thinking of bonsai! Trouble free and easy to care for, Juniper Procumbens 'Nana' is a very popular and well adapted houseplant variety, the perfect beginner bonsai tree.
  
  These bonsai trees have been trained into several essential styles and are now ready for your creative input! Most trees will be 'windswept' as seen in most photos, but can also be 'cascade' or 'upright' and other unique styles. Don't hesitate to make requests in your order notes!
  
  All trees come top dressed with fine decorative gravel (premium red lava rock) and an accent mineral (typically Fossil Rock or Snowflake/Firework Obsidian). Accent minerals are not just beautiful, but they're also useful for checking on soil moisture down below without disturbing the potting media. Fossil Rock is a sedimentary mineral with traces of preserved plants and animals (critters are not necessarily visible). Snowflake and Firework Obsidian are relatively rare forms of volcanic glass that display interesting white to red patterns. They're variations of Obsidian formed when volcanic lava cools more slowly than normal, allowing the formation of needle-shaped cristobalite, a type of quartz crystal. Some collectors believe these minerals have healing, calming, and soothing spiritual properties. Fossil Rock is not pictured above, however it is similar in aesthetic to Obsidian.",
  price:"24.55",
  availability:18
  })
  product5_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_5.jpeg')
  product5.photo.attach(io:product5_pic, filename: "product_5.jpeg")

  product6 = Product.create!({
  product_name: "Backflow Incense Burner",
  seller_id: 12,
  description: "Material : Ceramic+ Wood
  Size : 39Cm Hight
  49Cm Width
  Guanyin lamp Ring Ornaments- Colored Sand Yellow
  Overall 49*12*39 CM
  Guanyin Size : 13.2*7 Cm",
  price:"10.59",
  availability:4,
  })
  product6_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_6.jpeg')
  product6.photo.attach(io:product6_pic, filename: "product_6.jpeg")

  product7 = Product.create!({
  product_name: "Tibetan Bodhi Seed Bracelet",
  seller_id: 14,
  description: "This bracelet is handmade using 100% natural 5mm Bodhi seeds which are delicately carved. The silver charm is inscribed with the Buddhist mantra Om Mani Padme Hum. This is the most commonly recited Buddhist mantra in Tibet, it is believed to heal the body and mind, evoking a sense of peace.

  Size: The bracelet has an adjustable length between 16cm and 22cm .
  
  Weight: 6g.
  
  Bracelet will be dispatched from Ipstones, UK, within 1 working day. If you are purchasing from the USA or Europe and would like the option to track your parcel please select 'add delivery upgrade' at the checkout.",
  price:"12.32",
  availability:88
  })
  product7_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_7.jpeg')
  product7.photo.attach(io:product7_pic, filename: "product_7.jpeg")

  product8 = Product.create!({
  product_name: "Herb Grinder - Buddha Statue Design - 3pc Herb Grinders Herb Cutter Cutting and Grinding Metal Blades 2.5 Inch Travel Size",
  seller_id: 6,
  description: "FAQ: (as shown) means the grinder will be engraved as it appears in the photo. (add custom) means that you would like to alter the design or add text and will message us with instructions. (1 sided) means only the top will be engraved, (2 sided) means both the top and the bottom will be engraved. Please message us with any additional questions.FAQ: (as shown) means the grinder will be engraved as it appears in the photo. (add custom) means that you would like to alter the design or add text and will message us with instructions. (1 sided) means only the top will be engraved, (2 sided) means both the top and the bottom will be engraved. Please message us with any additional questions.FAQ: (as shown) means the grinder will be engraved as it appears in the photo. (add custom) means that you would like to alter the design or add text and will message us with instructions. (1 sided) means only the top will be engraved, (2 sided) means both the top and the bottom will be engraved. Please message us with any additional questions.Our all wood herb flower grinders measure approximately 2.5inch in diameter and 1.8inch tall. Compact but plenty large enough for grinding any herb, tobacco, or spice. Sharp teeth cut and grinder with ease. Strong Neodymium magnets hold it together. Shipped in its own individual cardstock kraft box, perfect for gift giving. Laser engraved on the island of Kauai, Hawaii. Free shipping for all US addresses.",
  price:"5.43",
  availability:63
  })
  product8_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_8.jpeg')
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
  price:"8.25",
  availability:35
  })
  product9_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_9.jpeg')
  product9.photo.attach(io:product9_pic, filename: "product_9.jpeg")

  product10 = Product.create!({
  product_name: "Colorful Buddha canvas wall art",
  seller_id: 3,
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
  price:"4.21",
  availability:632
  })
  product10_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_10.jpeg')
  product10.photo.attach(io:product10_pic, filename: "product_10.jpeg")

  product11 = Product.create!({
  product_name: "Tree of Life Amethyst Sphere",
  seller_id: 2,
  description: "Attracts Chi Energy, Enhance Love & Romance Relationships, Emotional, Spiritual, And Physical Planes To Promote Calm, Balance, And Peace At Your Place.

  Amethyst is one of the most popular 'healing stones' and the birthstone of February. It has been highly esteemed throughout the ages for its stunning beauty and legendary powers to stimulate and soothe the mind and emotions.
  
  SEVERAL MAIN FUNCTIONS:
  a)Amethyst's ability to expand the higher mind also enhances one's creativity and passion. It strengthens the imagination and intuition and refines the thinking processes. It helps in the assimilation of new ideas, putting thought into action, and brings projects to fruition.
  
  b)Amethyst's Emotional Healing Energy is especially supportive of the emotional body, bringing those who are overworked, overstressed, or overwhelmed back to center. It is the exact kind of relaxing energy that we could all use after a long day. Allow its energy to soothe away the day-to-day stresses that keep you up at night. It is a wonderful crystal to keep in your bedroom to encourage restful sleep. Working with it enhances your intuition and empowers you to trust it.",
  price:"4.28",
  availability:142
  })
  product11_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_11.jpeg')
  product11.photo.attach(io:product11_pic, filename: "product_11.jpeg")

  product12 = Product.create!({
  product_name: "Mini Buddha Statue",
  seller_id: 1,
  description: "Add serenity and peace to your space with our handmade, miniature, praying Buddha statues!

  Buddha teaches us to be kind, present, compassionate and patient. 🕉
  
  Use these peaceful Buddha statues to decorate your meditation corner, office space, or plant room. Our mini Buddha statues are durable and make for the the perfect gift of Zen!
  
  Please NOTE: these Buddha statues are not intended to be submerged under water or for under water Aquariums. They can however be used as a patio decoration. If you have any questions please don't hesitate to reach out.
  
  Each Buddha is handmade from an eco-friendly 🌱, non-toxic, sustainably produced water-based material, and then sealed using a 100% natural beeswax sealant, which provides water resistance, and long-lasting protection.
  
  Every piece is custom made and hand crafted in small batches, therefore they will all be unique, please allow for small air bubbles and slight color variation.
  
  Dependent on USPS availability and processing times, transit time from the time of shipping may take 2-6 business days. Please advise, due to significant delays with the USPS some orders may not arrive by the estimated delivery date. Once your package is in the possession of the USPS it is in their hands and we have no control of when it arrives, despite any shipping upgrades.
  ",
  price:"7.23",
  availability:91
  })
  product12_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_12.jpeg')
  product12.photo.attach(io:product12_pic, filename: "product_12.jpeg")

  product13 = Product.create!({
  product_name: "7 pieces Chakra Metal Wall Decor",
  seller_id: 2,
  description: "⭐7 pieces Chakra Metal Wall Decor, Chakra Metal Wallart set of 7, Chakra Wall Art,Chakras Wall Hangings, Spiritual Sign,Zen Home Decor

  ⭐Soft Art Chakras Metal Wall Decor
  
  ⭐FREE & EXPRESS SHIPPING!
  
  ⭐NO CUSTOMS FEES!
  
  ⭐READY TO HANG - Metal wall art arrives with jute rope, You can easily tie and hang The Chakras. You can adjust the total length of Chakras as you want. Each product can be hanged individually.
  
  ⭐MATERIAL: 1.5 mm mild steel (Highest quality)
  
  ⭐Size: (Each piece)
  
  15x15 cm/ 6x6 Inches
  20x20 cm/ 8x8 Inches
  25x25 cm/ 10x10 Inches
  
  ⭐COLOR: Electrostatic powder coating (Black, Gold, Feel free to ask for other colors)
  
  ⭐Break-resistant and sturdy
  
  ⭐No smell and harmful chemicals involved, concerning health-wise
  
  ⭐Delivery with a special packaging
  
  ⭐Moisture and damp resistant
  ",
  price:"4.29",                                    
  availability:875
  })
  product13_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_13.jpeg')
  product13.photo.attach(io:product13_pic, filename: "product_13.jpeg")

  product14 = Product.create!({
  product_name: "Zen Garden - Japanese Meditation Kit",
  seller_id: 3,
  description: "Find your Zen! This playful small sandbox lets anyone bring in the good vibes and energy into their own lives. It's a miniature zen garden that will sit perfectly on a coffee table or desk. Very intricate and detailed, and sure to capture people's attention.

  The starter kit comes with all the accessory pieces to make:
  Sunset Screen
  Japanese Lantern
  Sand Rake
  Arch Bridge
  Shinto Gate
  and the Happy Lucky kitty!
  
  The full set has everything the starter kit has (above), Plus:
  A unique combination of beach glass, color glass gems, or other decorative stones
  and a special tray to hold the extras
  Your choice of black quartz or white beach sand.
  Memento river stones and a small tealight candle finish this kit.",
  price:"8.25",
  availability:106
  })
  product14_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_14.jpeg')
  product14.photo.attach(io:product14_pic, filename: "product_14.jpeg")

  product15 = Product.create!({
  product_name: "Yoshino cherry live tree ",
  seller_id: 4,
  description: "Yoshino cherry live tree seedling 7 to 13 inches",
  price:"34.23",
  availability:876
  })
  product15_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_15.jpeg')
  product15.photo.attach(io:product15_pic, filename: "product_15.jpeg")

  product16 = Product.create!({
  product_name: "Monk Meditating - Ink Pen Style Canvas Art",
  seller_id: 5,
  description: "This unique Buddhism inspired piece focuses on a monk, reflecting through the art of mediation as he sits quietly under a tree.

  The fine reproduction features an ink pen style drawing, bringing with it a sense of permanence in an ever impermanent world.
  
  Available in multiple sizes. Poster print and stretched canvas are both available. Large sizes available for a limited time. Grab your copy of this unique conversation starter today.",
  price:"24.23",
  availability:543
  })
  product16_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_16.jpeg')
  product16.photo.attach(io:product16_pic, filename: "product_16.jpeg")

  product17 = Product.create!({
  product_name: "Okame cherry live tree",
  seller_id: 5,
  description: "Okame cherry live tree seedling 7 to 13 inches",
  price:"1.23",
  availability:865
  })
  product17_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_17.jpeg')
  product17.photo.attach(io:product17_pic, filename: "product_17.jpeg")

  product18 = Product.create!({
  product_name: "Icee Butter Slime // Sonria Slime // Zen",
  seller_id: 6,
  description: "A icee butter slime crafted for everyday stress relief.

  ♡ infused with lavender, sweet orange, and vanilla essential oil to reduce anxiety and encourage ultimate calmness.
  
  ☺ size: 7 fl. oz
  
  ⁂ this slime is part of our Wellness slime collection.",
  price:"12.25",
  availability:437
  })
  product18_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_18.jpeg')
  product18.photo.attach(io:product18_pic, filename: "product_18.jpeg")

  product19 = Product.create!({
  product_name: "500ml Large Creative Ceramic 3D Dog Shaped Mug",
  seller_id: 7,
  description: "Slight uneven hand painting, black spots, needle eyes, bubbles, etc. are within the normal range.

  Payment : PayPal and western union.
  
  Shipping
  Item will be shipped within 2-4 workdays of payment. I ship to Worldwide ,only use paypal address.
  
  Returns Policy:
  You will get the item same as the pictures!
  
  Contact me if there is any problem with your item
  
  Have a nice day!!",
  price:"6.29",
  availability:12
  })
  product19_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_19.jpeg')
  product19.photo.attach(io:product19_pic, filename: "product_19.jpeg")

  product20 = Product.create!({
  product_name: "Zen Buddha Tobacco Smoking Pipe",
  seller_id: 8,
  description: "Meditate and find your zen with this Buddha pipe! Handcrafted with patience and care, this piece is a clog-free tobacco smoking pipe with a natural coconut bowl.",
  price:"13.25",
  availability:76
  })
  product20_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_20.jpeg')
  product20.photo.attach(io:product20_pic, filename: "product_20.jpeg")
  
  product21 = Product.create!({
  product_name: "Cute Shark Cat Fried Shrimp Cats Plush Keychains",
  seller_id: 5,
  description: "Payment : PayPal and western union.
  Please you make the payment within 5 days once you order.
  Returns Policy:
  You will get the item same as the pictures!
  
  Contact me if there is any problem with your item
  
  Have a nice day!!!",
  price:"17.28",
  availability:43
  })
  product21_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_21.jpeg')
  product21.photo.attach(io:product21_pic, filename: "product_21.jpeg")

  product22 = Product.create!({
  product_name: "Octopus Stuffed Plush Toys",
  seller_id: 9,
  description: "Octopus Stuffed Plush Toys For Baby Kids Birthday Christmas Children Kid Gifts Cute Dolls Super Soft Plush Toy Cute Octopus Gift for Kids

  Description:
  Material: Soft Plush, PP Cotton;
  Suitable for ages 3+;
  Gender: Unisex;
  Form: Animal;
  Size: 7.1 in / 18 cm;
  Package Includes: 1PC Soft Plush Octopus
  
  Note:
  Due to the different monitor and light effect, the actual color maybe a slight different from the picture color.
  Please allow 2-3cm differs due to manual measurement.
  
  Shipping:
  Item will be delivered within 20-55 business days.
  It depends on your location and order amount.
  Due to the world health emergency, deliveries may be delayed.
  Do not hesitate to contact me if you have any questions.",
  price:"43.22",
  availability:420
  })
  product22_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_22.jpeg')
  product22.photo.attach(io:product22_pic, filename: "product_22.jpeg")

  product23 = Product.create!({
  product_name: "Mushroom Embroidery Mushroom Socks",
  seller_id: 10,
  description: "We only charge the freight once, so it's more cost-effective to buy more pairs

  Mushroom Embroidery Socks for women
  
  Adorable gift for any occasion.
  
  Information:
  
  Size: EU 36-40, UK 3-7, US 5-9
  
  Material: 85% cotton, 13% polyamide, 2% elastic fibre
  
  Price is for 1 pair of socks",
  price:"16.23",
  availability:666
  })
  product23_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_23.jpeg')
  product23.photo.attach(io:product23_pic, filename: "product_23.jpeg")

  product24 = Product.create!({
  product_name: "The Froggy Pouch",
  seller_id: 11,
  description: "🐸THE FROGGY POUCH 🐸

  🌷designed by me
  🌷a very fluffy and soft frog design plush pouch (verrrry soft!!!!)
  🌷perfect size for makeup, small art supplies, school stuff, anything!! i use mine for cards/iphone 11/keys :)
  🌷size is roughly 6.5x4.5
  🌷 purple satin inner lined pocket",
  price:"17.23",
  availability:777
  })
  product24_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_24.jpeg')
  product24.photo.attach(io:product24_pic, filename: "product_24.jpeg")

  product25 = Product.create!({
  product_name: "Shark Slippers Soft Sole",
  seller_id: 5,
  description: "These Woman Shark Slippers are so cute, you won't be able to keep yourself from smiling! They're the perfect gift for anyone who loves sharks—or just wants to cuddle up with one in their slippers.

  The only question is, what will you wear them with?",
  price:"8.25",
  availability:222
  })
  product25_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_25.jpeg')
  product25.photo.attach(io:product25_pic, filename: "product_25.jpeg")

  product26 = Product.create!({
  product_name: "PP Plush Pillow",
  seller_id: 12,
  description: "LUCKY CUSTOMERS WILL RECEIVE A FREE KEYCHAIN IN THEIR PACKAGES :)

  Best Gift / Joke Idea / Prank for April Fools!
  
  Fast Delivery: We ship within one business day!
  
  Cute PP plush/pillow available in color:
  
  - Light
  - Dark
  
  Available in size:
  
  - 12 inch
  - 20 inch
  - 28 inch
  - 35 inch
  
  Caution: Stay away from fire
  
  FINAL SALE, no exchange, refund, or order cancellation",
  price:"9.24",
  availability:432
  })
  product26_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_26.jpeg')
  product26.photo.attach(io:product26_pic, filename: "product_26.jpeg")

  product27 = Product.create!({
  product_name: "Cute Lighter Kitty Keychain",
  seller_id: 13,
  description: "✅FREE SHIPPING WORLDWIDE✅

  Ayyy!! This is the most adorable Kuromi lighter you'll ever have!
  
  the design is so cute, your friends will want to steal it from you!
  
  high quality refillable lighter / use normal butane gas
  
  lighter comes without fluid due to secruity reasons",
  price:"11.22",
  availability:456
  })
  product27_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_27.jpeg')
  product27.photo.attach(io:product27_pic, filename: "product_27.jpeg")

  product28 = Product.create!({
  product_name: "Meditating Cat Zen Art",
  seller_id: 14,
  description: "Meditate on this Zen wall art! This print is a great gift for those who want to bring a bit of peace and tranquility into their lives. Whether you use the poster in a yoga studio or in your home, this print will help you find your Zen.

  This print is designed by Already There, and we are the only place you can purchase this copyrighted art. It's not available in stores or elsewhere. Get your copy while it's still available.
  
  Our poster is printed on thick and durable matte paper - Giclée printing quality
  Frame not included
  
  Any questions, feel free to contact us :). We can also accommodate special requests to print the poster design on mugs, puzzles, shirts, fabrics and more. Reach out to us with your ideas!
  ----------------------
  Available Sizes
  ----------------------
  12x18
  16x20
  18x24
  24x36",
  price:"43.27",
  availability:457
  })
  product28_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_28.jpeg')
  product28.photo.attach(io:product28_pic, filename: "product_28.jpeg")

  product29 = Product.create!({
  product_name: "Cool cat Zen garden",
  seller_id: 15,
  description: "Round black plastic base 6 x 6 x 3 inches in height

  White and orange miniature whimsical cool cat
  
  Assorted flowers
  
  Small smooth stones
  
  Artificial bamboo
  
  White non toxic sand 30 ounces
  
  Black Stylus - Caution: stylus point is sharp. Handle with care
  
  Arrange as you wish. Keep out of reach of small children due to choking hazard.
  
  Sand taped to box to prevent damage during shipping.",
  price:"35.29",
  availability:65
  })
  product29_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_29.jpeg')
  product29.photo.attach(io:product29_pic, filename: "product_29.jpeg")

  product30 = Product.create!({
  product_name: "Yoga Night Light Led Lamp",
  seller_id: 16,
  description: "DELIVERY BEFORE CHRISTMAS IS UNDER GUARANTEE!!

  Are you looking for a gift for your loved one who loves yoga and meditation? You are at the right place. With this special designed lamp, your loved one will remember you every time he/she doing her yoga/meditation routine.
  
  
  Acrylic sheet (Upper part) is prepared by laser cutting of unbreakable transparent material.
  The bottom base is solid wood, measuring 14 cm x 3 cm.
  The acrylic sheet is 4mm thick.
  The total lamp size is 19 cm x 14 cm with the bottom wooden pedestal.
  The powerful LED lamp gives yellow color.
  You can also use it for decorative purposes in your home, office, or as a night light.
  It works with desktop computers, laptops, and power banks with USB input.",
  price:"9.28",
  availability:796
  })
  product30_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_30.jpeg')
  product30.photo.attach(io:product30_pic, filename: "product_30.jpeg")

  product31 = Product.create!({
  product_name: "Lucky Cat Design Ceramic Tea Set",
  seller_id: 17,
  description: "Lucky Cat Design Ceramic Tea Sets Teacup with Filter Hole, Cute Cat Tea Mug with Travel Case 300ml

  *Bullet Point*
  
  ---These mugs are made of durable pottery, premium LEAD-FREE, and can be used for dishwasher---
  
  This tea mug include :
  
  x 1 Tea mug ( 300ml)
  
  x 1 Portable teacup handbag[Travel case]
  
  This glass and ceramic tea mugs provides you with all you need for a Tea Ceremony event / party with your friends or co-workers at the office outdoors or at home. A perfect Christmas or birthday gift.
  
  Ideal for your presentation of tea lovers
  
  Special requests/custom order: simply write to us
  
  ***Business/Bulk orders or inquiries can offer big discount.(QTY more than 5sets)",
  price:"6.25",
  availability:4
  })
  product31_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_31.jpeg')
  product31.photo.attach(io:product31_pic, filename: "product_31.jpeg")
  
  product32 = Product.create!({
  product_name: "Neon Fractal Portal",
  seller_id: 18,
  description: "This blacklight reactive canopy was created by warping fluid acrylic artwork through a rainbow supernova.

  Glow up your space with a trip into space and the astral dimension.
  
  A great choice for your living room, bedroom, yoga studio, creative studio, art workshop, or a background for DJ at festivals or parties.
  
  
  Proudly designed and printed in the USA.",
  price:"8.25",
  availability:38
  })
  product32_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_32.jpeg')
  product32.photo.attach(io:product32_pic, filename: "product_32.jpeg")

  product33 = Product.create!({
  product_name: "Dandelion Night Light",
  seller_id: 16,
  description: "Dandelion Night Light, Real Dandelion puff Paperweight, Flower Epoxy Resin Nightlight, Epoxy Resin WoodTable Lamp, Gift for girlfriend

  'Dent de Lion' in French, or rather 'Tooth of the Lion', refers to the jagged teeth along the edges of the leaves. It is said that if you gather the seeds and blow them into the wind, your wish will be granted by Zeus himself!
  
  Dandelions are beautiful blooms that will brighten up any space with their cheerful yellow tones. Your mind will melt in the ESCtasy brought by Dandelions eternal presence
  
  The real Dandelion is captured in a crystal clear paperweight. Each paperweight is unique, with no two being identical, making them very special gifts for your friends, family, and someone you loved.
  
  This piece was made with real flowers and hence it is important to preserve the lamp provided safely away from direct sunlight. When you turn on this lamp, the soft light will spark around and bring a peaceful after a hard-working day.
  
  We can engrave your name, gift message for your lover",
  price:"7.77",
  availability:134
  })
  product33_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_33.jpeg')
  product33.photo.attach(io:product33_pic, filename: "product_33.jpeg")

  product34 = Product.create!({
  product_name: "Stash Box Combo",
  seller_id: 14,
  description: "Stunning Bamboo Stash Box Kit with Original Artwork by RealFunWOW - Desert Visions Stash Box Combo - Accessories Kit, Locking Wooden Box with Grinder, Rolling Tray, Smell Proof Glass Jar, Bamboo Box with Lock

  Handmade locking bamboo box contains a 4-piece titanium grinder, UV glass jar, and metal rolling tray. The original artwork for this set was created by Californian artist Daren of RealFunWow! Allow the all seeing eye on the box to watch over your goods or simply appreciate the beauty of this set.
  
  PERFECT COMBO! This stash box combo consists of a beautiful handmade bamboo box with original artwork, high quality four-piece grinder, UV glass jar, and metal rolling tray. All the items store neatly inside the box. Ideal gift set for the traveling smoker. This accessories kit makes for a great gift!
  
  GRINDER! Durable four-piece titanium grinder. Neodymium magnets allow for smooth grinder and secure closure.Stainless steel screen catcher compartment. Pollen scraper included.",
  price:"6.66",
  availability:142
  })
  product34_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_34.jpeg')
  product34.photo.attach(io:product34_pic, filename: "product_34.jpeg")

  product35 = Product.create!({
  product_name: "Wooden Mushroom Lamp",
  seller_id: 13,
  description: "🎁Our table lamp adopts an adorable mushroom design, delicate and practical. This creative mushroom table lamp will bring a soothing and relaxing vibe to your home!

  This mushroom lamp is made of high-quality wood, which makes it durable and long-lasting. And you can use it with confidence.
  
  Unique in style, our wooden mushroom lamp can not only bring up light but also can be an excellent interior addition.
  
  Meanwhile, these wooden mushroom lamps are unique gifts for friends and family on birthdays, Christmas and other special events.
  
  🎈SPECIFICATIONS:
  ▶Material: Beech Wood
  ▶Light Source Type: LED
  ▶Light Color: Warm Color
  ▶Color: Coffee, Khaki
  ▶Voltage: ≤36V
  ▶Switch: Touch Button
  ▶Battery: Lithium Battery
  ▶Power Supply Mode: Rechargeable
  ▶Size:
  A: 100*165mm
  B: 100*165mm
  C: 90*105mm
  D: 90*105mm
  
  *The color may have a slight difference due to different screen displays.
  
  *Because wood is a natural material, each product will have different wood grains, and some products may have knots, wood marks or rosin, which is normal.
  
  Related to this item: Mushroom Lamp, Table Lamps, Furniture Decoration, Wooden Lamps, Bedroom Lights, LED Lights, Night Light, Mushroom Decor, Unique Lamp, Home Decorations, Birthday Gifts, Christmas Gift, Housewarming Gift",
  price:"8.69",
  availability:865
  })
  product35_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_35.jpeg')
  product35.photo.attach(io:product35_pic, filename: "product_35.jpeg")

  product36 = Product.create!({
  product_name: "Lotus Flower Necklace",
  seller_id: 12,
  description: "Personalized Engraved Women's Lotus Flower Boho Spiritual Inspirational Stainless Steel and Optional 18K Gold Plating Circle Glass Pendant Necklace in a Free Gift Box.

  Spiritual jewelry has always been a form of celebrating the body as well as a way of transcending into the real essence of the universe.
  This necklace illuminates the whole sacred area from your throat chakra to the heart chakra . When these chakras are finetuned and in flow, you can speak your truth, share deep and divine love, and welcome creative play and warrior power into your world.
  
  This short and adjustable necklace, made of high quality polished 316L surgical grade Stainless Steel, features a unique glass pendant. 316L stainless steel is low reaction, with minimum nickel content.
  This necklace can be personalized with your choice of text, engraved on the back of the pendant.
  
  The Lotus flower is regarded in many different cultures, especially in eastern religions, as a symbol of purity, enlightenment, self-regeneration and rebirth. Its characteristics are a perfect analogy for the human condition: even when its roots are in the dirtiest waters, the Lotus produces the most beautiful flower.
  
  This jewelry item is the perfect keepsake! whether for yourself or a loved one.
  
  ITEM DETAILS:
  • One high quality polished surgical steel pendant necklace.
  • Optional 18k gold plating.
  • Shatterproof liquid glass pendant.
  • Snake chain.
  • Necklace arrives in a jewelry box.
  • Made in the U.S.A.
  
  Measurements (approx.):
  • Circle pendant: 0.9inch x 0.9inch (23.5mm x 23.5mm).
  • Necklace Length: 18-22inches (45-56cm) adjustable.
  
  Optional back engraving:
  • Up to 2 lines.
  • Up to 20 characters per line (40 characters in total).
  
  Care Instructions:
  • It's fine to get the jewelry wet. Make sure to dry it afterwards.
  • Clean using plain soap and water - drying with a soft cloth.
  • Fully dry before storing. Do not store in a moist environment.
  • When storing, avoid storing it mixed amongst other jewelry.
  • While wearing, avoid exposure to chemicals (including cleaning agents), and avoid wearing in environments where the item may be knocked.
  
  Please note that the colors you see on your monitor may differ slightly from the physical print due to variations in monitor calibration settings.
  
  I DO NOT accept returns and cancellations for this item - However, if for any reason you are not happy with your purchase, you can convo or email me to find the best resolution for you.",
  price:"12.25",
  availability:54
  })
  product36_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_36.jpeg')
  product36.photo.attach(io:product36_pic, filename: "product_36.jpeg")

  product37 = Product.create!({
  product_name: "Japanese Pagoda Lantern",
  seller_id: 11,
  description: "This is our newest lantern inspired by beautiful Japanese architecture! It holds a little tea light candle casting incredible shadows and giving a stylish, clean, modern look to your room. This item was designed by us and laser cut out of birch wood in our home studio in Nashville.
  It comes flat packed as a kit that you put together yourself. Assembly required and enjoyed!
  
  WHAT TO EXPECT
  • This Japanese Pagoda Lantern ships flat-packed, unassembled, and ready to get your inner child excited.
  • After unpacking and following the assembly instructions found on our website (onemanonegarage.com) you will put your new creation to the test. Turn it on, dim the lights, and be mesmerized!
  • If you are giving this as a gift we strongly recommend you let the recipient enjoy the assembling process. They will love you for the experience you're giving them!",
  price:"7.24",
  availability:123
  })
  product37_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_37.jpeg')
  product37.photo.attach(io:product37_pic, filename: "product_37.jpeg")

  product38 = Product.create!({
  product_name: "Zen Circle Metal Wall Art",
  seller_id: 10,
  description: "Elevate your home decor with this zen circle metal wall art!
  This enso circle decor can be also a zen gift!
  
  🏷️ Use the code 30OFF to save 30% when you buy 2 or more metal signs!
  
  🧱 MATERIAL
  18 gauge steel and powder coated.
  The coating paint allows for indoor or outdoor use.
  
  🛠️ INSTALLATION
  Just drive a nail or two into the wall, no additional assembly required. Another alternative is to use magnetic screws.
  Mounting hardware, nails or screws are NOT Included.",
  price:"4.25",
  availability:343
  })
  product38_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_38.jpeg')
  product38.photo.attach(io:product38_pic, filename: "product_38.jpeg")

  product39 = Product.create!({
  product_name: "Zen Circle Neon Light",
  seller_id: 7,
  description: "Bedroom Neon Sign is a perfect mothers day gift or indie room decor. This led sign can be customized in any color. Also, you are welcome to order a neon sign with custom text, picture, or logo - just send us a convo.

  Available colors: Cold white, Warm white, lemon, Yellow, Orange, Pink, Violet, Red, Green, Blue, and Cyan.
  Materials: Eco acrylic (plastic) & Premium flex-neon.
  
  HOW TO ORDER CUSTOM SIGNS?
  Create your custom neon sign with your own elements by choosing a color, size, font, number of lines of your text, and cutting shape. Feel free to contact us if you would like to make your own design/logo/drawing in neon sign with NeonProdax. It will be our pleasure to work it out with you. We will provide you custom mockup and quote for your custom sign within 24 hours.
  
  OUR BENEFITS:
  - Flex-neon is a led tape, which is hermetically sealed with a layer of silicone;
  - Only high-quality components are used in our silicone. This affects the quality of the light;
  - 50 000 h service life.
  - Food contact permit;
  - Recyclable;
  - The material is defended by the protective film on both sides
  - You can adjust the brightness level.
  - 365 days of warranty for technical defects (doesn't include shipping).
  - 12 hours warranty for the wholeness of the sign after delivery.
  - The sign is lost? - We will make you a new one.
  - 100% similarity of the real sign to the project.",
  price:"8.75",
  availability:45
  })
  product39_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_39.jpeg')
  product39.photo.attach(io:product39_pic, filename: "product_39.jpeg")

  product40 = Product.create!({
    product_name: "Yellow and Blue Fumed Glass Pipe",
    seller_id: 2,
    description: "3.75inch Sturdy Glass Pipe with Golden Iridescent Fumed Glass and Swirling Blue Design

    Features:
    - Ethereal, iridescent colors
    - Luminous, brighter (& bluer) colors in sunlight
    - Deep blue hues revealed in BRIGHT LIGHT!
    - Made from thick, durable borosilicate glass
    - Clean and functional design
    - Hand blown
    - Easy to clean
    
    Each pipe's design and color varies slightly as each pipe is made by hand. I inspect each piece carefully to ensure quality and satisfaction.
    
    I take my photos with bright photography lighting to show the detail in my work. Videos are taken in natural sunlight.
    
    Fast shipping from the USA.",
    price:"18.75",
    availability:420
    })
    product40_pic = URI.open('https://etzy-seeds.s3.amazonaws.com/product_40.jpeg')
    product40.photo.attach(io:product40_pic, filename: "product_40.jpeg")

    

  puts "Done!"
end