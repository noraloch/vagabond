# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# puts "Destroying"
# User.destroy_all
# Review.destroy_all
# Place.destroy_all


puts "Creating Users 👨‍👨‍👧‍👦"
20.times do 
  User.create(name: Faker::FunnyName.name, username: Faker::Music::RockBand.name)
end


res = RestClient.get("https://api.teleport.org/api/urban_areas")
res_body = res.body
places = JSON.parse(res_body)

cities = places["_links"]["ua:item"]

cities.each do |city|
    # construct image api url
    image_api = city["href"] + "images/"

    # make a GET request to the image api endpoint
    image_data_res = RestClient.get(image_api)
    image_data_body = image_data_res.body
    image_data = JSON.parse(image_data_body)

    photo = image_data["photos"][0]["image"]["web"]

    city_name = city["name"]

    Place.create(name: city_name, image: photo)

end

# User.create(name: "John", username: "John91", date_of_birth: "09/21/1992", password: "abc123")


