# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "json"

puts "Cleaning database..."
Movie.destroy_all


Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

Faker::Movies::Avatar.character #=> "Miles Quaritch"

Faker::Movies::Avatar.date #=> "December 18, 2009"

Faker::Movies::Avatar.quote #=> "It is hard to fill a cup that is already full."

Faker::Movies::HarryPotter.character #=> "Harry Potter"

Faker::Movies::HarryPotter.location #=> "Hogwarts"

Faker::Movies::HarryPotter.quote #=> "I solemnly swear that I am up to no good."

Faker::Movies::HarryPotter.book #=> "Harry Potter and the Chamber of Secrets"

Faker::Movies::HarryPotter.house #=> "Gryffindor"

Faker::Movies::HarryPotter.spell #=> "Reparo"

TOP_RATED_URL = "https://tmdb.lewagon.com/movie/top_rated"

puts "Parsing movie database..."
movies = JSON.parse(RestClient.get(TOP_RATED_URL))

movies["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"].round(1)
  )
  puts "Created #{movie["title"]}"
end

puts "Finished!"
