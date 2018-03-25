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
