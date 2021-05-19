require 'faker'

Favorite.destroy_all
User.destroy_all
Kitchen.destroy_all
Booking.destroy_all
Review.destroy_all

# Amenity seed
Amenity.destroy_all

Amenity.create(name: "WiFi")
Amenity.create(name: "ensuite restroom")
Amenity.create(name: "shared restroom")
Amenity.create(name: "dry storage")
Amenity.create(name: "freezer storage")
Amenity.create(name: "cold storage")
Amenity.create(name: "commercial oven")
Amenity.create(name: "mixer")
Amenity.create(name: "poofer")
Amenity.create(name: "induction cooktop")
Amenity.create(name: "event space")
Amenity.create(name: "parking")

# Kitchens seed
puts "Database clean!"

20.times do
    user = User.create!(
        email: Faker::Internet.email,
        user_name: Faker::Internet.username,
        password: "password",
        first_name: Faker::JapaneseMedia::DragonBall.character,
        last_name: Faker::JapaneseMedia::DragonBall.race,
        phone_number: Faker::PhoneNumber.phone_number_with_country_code
    )
    rand(0..2).times do
        kitchen = Kitchen.create!(
            title: Faker::Space.planet + rand(1..10000).to_s,
            description: Faker::Quote.yoda,
            size: rand(30..300),
            listing_status: ["listed", "snooze", "unlisted"].sample,
            address: ["Munich, Marienplatz", "Garching", "Munich, Englischer Garten", "Wolfratshausen","Erding"].sample,
            price: rand(30..300), 
            cancellation_policy: ["flexible", "moderate", "strict"].sample,
            opening_time: rand(5..12),
            closing_time: rand(13..21),
            user: user
        )
    
        rand(0..2).times do
            start_date = Date.today + rand(2..7)
            booking = Booking.create(
                start_date: start_date,
                end_date: start_date + rand(1..30),
                total_price: rand(100..2000),
                kitchen: kitchen,
                user: User.where.not(id: user.id).sample
            )

            if [true, false].sample
                review = Review.create(
                    rating: rand(1..5),
                    content: Faker::ChuckNorris.fact,
                    booking: booking,
                    user: booking.user,
                    reply: [true, false].sample ? Faker::Fantasy::Tolkien.poem : nil
                )  
            end
        end
    end

end