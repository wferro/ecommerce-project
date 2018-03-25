# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke", chocoball: cmovie: movies.first)
#AdminUser.create!(email: 'admin@example.com", chocoball: cpassword: 'password", chocoball: cpassword_confirmation: 'password') if Rails.env.development?

Brigadeiro.destroy_all
Chocoball.destroy_all
Sprinkle.destroy_all

s1 = Sprinkle.create(name: "Dark Chocolate Vermicelli", description: "The dark chocolate vermicelli sprinkles are the most common used sprinkles in Brasil. To maintain our high quality standards we outsource them from Callebaut. ",                                             price: 100, image: "sprinkle_dark.jpg")
s2 = Sprinkle.create(name: "Shreded Coconut",           description: "The shreded coconut makes the texture of your Chocoball Brigadeiro be irreristible. A must try topping.",                                                                                                     price: 100, image: "sprinkle_shreded_coconut.jpg")
s3 = Sprinkle.create(name: "Natural Almonds",           description: "The natural almonds are lightly rosted and add the perfect crunchiness to your Chocoball Brigadeiro",                                                                                                         price: 100, image: "sprinkle_almond.jpg")
s4 = Sprinkle.create(name: "Pink Sugar",                description: "The pink sugar is a very fun topping and it is the favourite of the kids",                                                                                                                                    price: 100, image: "sprinkle_pink_sugar.jpg")
s5 = Sprinkle.create(name: "Mini Crispearls",           description: "Callebaut`s mini crispearls are mixed with dark, milk and white chocolate, their crunchy biscuit heart makes them completely irresistible.",                                                                  price: 100, image: "sprinkle_mini_crispearls.jpg")
s6 = Sprinkle.create(name: "Salted Caramel Crispearls", description: "Callebaut salted caramel is perfect for someone that likes the mixture of sweet and salty flavor, their crunchy biscuit heart makes them completely irresistible. ",                                          price: 100, image: "sprinkle_salted_caramel_crispearls.jpg")
s7 = Sprinkle.create(name: "White Crispearls",          description: "Callebaut white crispearls not only look amazing, but also taste, , their crunchy biscuit heart makes them completely irresistible. ",                                                                        price: 100, image: "sprinkle_white_crispearls.jpg")
s8 = Sprinkle.create(name: "Blossoms Duo",              description: "White and dark chocolate blossoms add a festive and sophisticated touch to your Chocoball Brigadeiro. They not only look great but they also taste the part as they are made with 100% Callebaut chocolate.", price: 100, image: "sprinkle_blossoms_duo.jpg")
s9 = Sprinkle.create(name: "Milk Chocolate Flakes",     description: "Callebaut milk chocolate flakes have a pleasant texture and irregular shapes which makes them completely irresistible ",                                                                                      price: 100, image: "sprinkle_chocolate_flakes.jpg")
s10= Sprinkle.create(name: "White Chocolate Blossom",   description: "White chocolate blossoms add a festive and sophisticated touch to your Chocoball Brigadeiro.  They not only look great but they also taste the part as they are made with 100% Callebaut chocolate.",         price: 100, image: "sprinkle_white_blossom.jpg")
s11= Sprinkle.create(name: "Dark Chocolate Blossom",    description: "Dark chocolate blossoms add a festive and sophisticated touch to your Chocoball Brigadeiro. They not only look great but they also taste the part as they are made with 100% Callebaut chocolate.",           price: 100, image: "sprinkle_dark_blossom.jpg")

puts "Created #{Sprinkle.count} Sprinkles."

c1 = Chocoball.create(name: "Dark Chocolate",  description: "Our dark chocolate brigadeiro paste is made with the highest quality of Belgian Chocolate available, we outsource our chocolate from Callebaut",  price: 83, image: "filling_dark.jpg")
c2 = Chocoball.create(name: "White Chocolate", description: "Our white chocolate brigadeiro paste is made with the highest quality of Belgian Chocolate available, we outsource our chocolate from Callebaut", price: 83, image: "filling_white.jpg")
c3 = Chocoball.create(name: "Strawberry",      description: "Our strawberry paste is chocolate free for those that do not want to eat much chocolate. This one is the favourtie of the kids.",  price: 100, image: "filling_strawberry.jpg")

puts "Created #{Chocoball.count} Chocoballs."

Brigadeiro.create(name: "Dark Chocolate & Dark Chocolate Vermicelli", description: "Dark Chocolate & Dark Chocolate Vermicelli", chocoball: c1, sprinkle: s1, image: "dark_dark_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Shreded Coconut",           description: "Dark Chocolate & Shreded Coconut",           chocoball: c1, sprinkle: s2, image: "dark_shreded_coconut_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Natural Almonds",           description: "Dark Chocolate & Natural Almonds",           chocoball: c1, sprinkle: s3, image: "dark_almond_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Pink Sugar",                description: "Dark Chocolate & Pink Sugar",                chocoball: c1, sprinkle: s4, image: "dark_pink_sugar_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Mini Crispearls",           description: "Dark Chocolate & Mini Crispearls",           chocoball: c1, sprinkle: s5, image: "dark_mini_crispearls_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Salted Caramel Crispearls", description: "Dark Chocolate & Salted Caramel Crispearls", chocoball: c1, sprinkle: s6, image: "dark_salted_caramel_crispearls_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & White Crispearls",          description: "Dark Chocolate & White Crispearls",          chocoball: c1, sprinkle: s7, image: "dark_white_crispearls_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Blossoms Duo",              description: "Dark Chocolate & Blossoms Duo",              chocoball: c1, sprinkle: s8, image: "dark_blossom_duo_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Milk Chocolate Flakes",     description: "Dark Chocolate & Milk Chocolate Flakes",     chocoball: c1, sprinkle: s9, image: "dark_chocolate_flakes_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & White Chocolate Blossom",   description: "Dark Chocolate & White Chocolate Blossom",   chocoball: c1, sprinkle: s10,image: "dark_white_blossom_img.jpg")
Brigadeiro.create(name: "Dark Chocolate & Dark Chocolate Blossom",    description: "Dark Chocolate & Dark Chocolate Blossom",    chocoball: c1, sprinkle: s11,image: "dark_dark_blossom_img.jpg")
Brigadeiro.create(name: "White Chocolate & Dark Chocolate Vermicelli",description: "White Chocolate & Dark Chocolate Vermicelli",chocoball: c2, sprinkle: s1, image: "white_dark_img.jpg")
Brigadeiro.create(name: "White Chocolate & Shreded Coconut",          description: "White Chocolate & Shreded Coconut",          chocoball: c2, sprinkle: s2, image: "white_shreded_coconut_img.jpg")
Brigadeiro.create(name: "White Chocolate & Natural Almonds",          description: "White Chocolate & Natural Almonds",          chocoball: c2, sprinkle: s3, image: "white_almond_img.jpg")
Brigadeiro.create(name: "White Chocolate & Pink Sugar",               description: "White Chocolate & Pink Sugar",               chocoball: c2, sprinkle: s4, image: "white_pink_sugar_img.jpg")
Brigadeiro.create(name: "White Chocolate & Mini Crispearls",          description: "White Chocolate & Mini Crispearls",          chocoball: c2, sprinkle: s5, image: "white_mini_crispearls_img.jpg")
Brigadeiro.create(name: "White Chocolate & Salted Caramel Crispearls",description: "White Chocolate & Salted Caramel Crispearls",chocoball: c2, sprinkle: s6, image: "white_salted_caramel_crispearls_img.jpg")
Brigadeiro.create(name: "White Chocolate & White Crispearls",         description: "White Chocolate & White Crispearls",         chocoball: c2, sprinkle: s7, image: "white_white_crispearls_img.jpg")
Brigadeiro.create(name: "White Chocolate & Blossoms Duo",             description: "White Chocolate & Blossoms Duo",             chocoball: c2, sprinkle: s8, image: "white_blossom_duo_img.jpg")
Brigadeiro.create(name: "White Chocolate & Milk Chocolate Flakes",    description: "White Chocolate & Milk Chocolate Flakes",    chocoball: c2, sprinkle: s9, image: "white_chocolate_flakes_img.jpg")
Brigadeiro.create(name: "White Chocolate & White Chocolate Blossom",  description: "White Chocolate & White Chocolate Blossom",  chocoball: c2, sprinkle: s10,image: "white_white_blossom_img.jpg")
Brigadeiro.create(name: "White Chocolate & Dark Chocolate Blossom",   description: "White Chocolate & Dark Chocolate Blossom",   chocoball: c2, sprinkle: s11,image: "white_dark_blossom_img.jpg")
Brigadeiro.create(name: "Strawberry & Dark Chocolate Vermicelli",     description: "Strawberry & Dark Chocolate Vermicelli",     chocoball: c3, sprinkle: s1, image: "straw_dark_img.jpg")
Brigadeiro.create(name: "Strawberry & Shreded Coconut",               description: "Strawberry & Shreded Coconut",               chocoball: c3, sprinkle: s2, image: "straw_shreded_coconut_img.jpg")
Brigadeiro.create(name: "Strawberry & Natural Almonds",               description: "Strawberry & Natural Almonds",               chocoball: c3, sprinkle: s3, image: "straw_almond_img.jpg")
Brigadeiro.create(name: "Strawberry & Pink Sugar",                    description: "Strawberry & Pink Sugar",                    chocoball: c3, sprinkle: s4, image: "straw_pink_sugar_img.jpg")
Brigadeiro.create(name: "Strawberry & Mini Crispearls",               description: "Strawberry & Mini Crispearls",               chocoball: c3, sprinkle: s5, image: "straw_mini_crispearls_img.jpg")
Brigadeiro.create(name: "Strawberry & Salted Caramel Crispearls",     description: "Strawberry & Salted Caramel Crispearls",     chocoball: c3, sprinkle: s6, image: "straw_salted_caramel_crispearls_img.jpg")
Brigadeiro.create(name: "Strawberry & White Crispearls",              description: "Strawberry & White Crispearls",              chocoball: c3, sprinkle: s7, image: "straw_white_crispearls_img.jpg")
Brigadeiro.create(name: "Strawberry & Blossoms Duo",                  description: "Strawberry & Blossoms Duo",                  chocoball: c3, sprinkle: s8, image: "straw_blossom_duo_img.jpg")
Brigadeiro.create(name: "Strawberry & Milk Chocolate Flakes",         description: "Strawberry & Milk Chocolate Flakes",         chocoball: c3, sprinkle: s9, image: "straw_chocolate_flakes_img.jpg")
Brigadeiro.create(name: "Strawberry & White Chocolate Blossom",       description: "Strawberry & White Chocolate Blossom",       chocoball: c3, sprinkle: s10,image: "straw_white_blossom_img.jpg")
Brigadeiro.create(name: "Strawberry & Dark Chocolate Blossom",        description: "Strawberry & Dark Chocolate Blossom",        chocoball: c3, sprinkle: s11,image: "straw_dark_blossom_img.jpg")

puts "Created #{Brigadeiro.count} Brigadeiros."
