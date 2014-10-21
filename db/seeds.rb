require 'faker'
20.times do User.create(
            first_name:             Faker::Name.first_name,
            last_name:              Faker::Name.last_name,
            username:               Faker::Name.name,
            email:                  Faker::Internet.email,
            motto:                  "Ajax for What!?", 
            remote_photo_url:       "http://robohash.org/sitsequiquia.png?size=300x300",
            professional_blurb:     "Professional Rebase Consultant")
end

# Activity.create(title:  ["Climbing!","Biking","Drinking","Kayaking","Paddleboarding","Sailing","Surfing","Other"].sample,
#                 description: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum",
#                 category:  ["Climbing!","Biking","Drinking","Kayaking","Paddleboarding","Sailing","Surfing","Other"].sample,
#                 location:  "Planet Granite",
#                 necessities: "Shoes and a great attitude"
#               )

# Event.create(date: "2014-10-31",
#              start_time: "10:00am",
#              duration: "6 hours + drinking overtime",
#              activity_id: n)

# end

# Vote.create(user_id: 1, activity_id: 1)
# Vote.create(user_id: 1, activity_id: 2)
# Vote.create(user_id: 1, activity_id: 3)
# Vote.create(user_id: 2, activity_id: 1)
# Vote.create(user_id: 2, activity_id: 2)
# Vote.create(user_id: 2, activity_id: 3)
# Vote.create(user_id: 3, activity_id: 1)
# Vote.create(user_id: 3, activity_id: 2)
# Vote.create(user_id: 3, activity_id: 3)
# Vote.create(user_id: 4, activity_id: 1)
# Vote.create(user_id: 4, activity_id: 2)
# Vote.create(user_id: 4, activity_id: 3)
# Vote.create(user_id: 5, activity_id: 1)
# Vote.create(user_id: 5, activity_id: 2)
# Vote.create(user_id: 5, activity_id: 3)
