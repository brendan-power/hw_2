# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output
# puts "Movies"
# puts "======"
# puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
# puts ""
# puts "Top Cast"
# puts "========"
# puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# ASSIGNMENT STARTING SPOT
# Deletes all data so it doesn't repeat
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# NOTE on naming: When creating objects, name them with an underscore seprating the type of thing and instance
# NOTE on naming: When descrbing objects for the purpose of creating foreign keys, do not use the underscore

# Adds in data to the studios tables

WarnerBros = Studio.new
WarnerBros["name"] = "WarnerBros"
WarnerBros.save

# Adds in data to the movie tables, after naming studios for foreign keys 

studio1 = Studio.find_by({ "name" => "WarnerBros" })

movie_1 = Movie.new
movie_1["title"] = "Batman Begins"
movie_1["year_released"] = "2005"
movie_1["rating"] = "PG-13"
movie_1["studio_id"] = studio1["id"]
movie_1.save

movie_2 = Movie.new
movie_2["title"] = "The Dark Knight"
movie_2["year_released"] = "2008"
movie_2["rating"] = "PG-13"
movie_2["studio_id"] = studio1["id"]
movie_2.save

movie_3 = Movie.new
movie_3["title"] = "The Dark Knight Rises"
movie_3["year_released"] = "2012"
movie_3["rating"] = "PG-13"
movie_3["studio_id"] = studio1["id"]
movie_3.save


# Adds in data to the actor tables, after naming the movies for foreign keys 
movie1 = Movie.find_by({ "title" => "Batman Begins" })
movie2 = Movie.find_by({ "title" => "The Dark Knight" })
movie3 = Movie.find_by({ "title" => "The Dark Knight Rises" })

actor_1 = Actor.new
actor_1["name"] = "Christian Bale"
actor_1.save

actor_2 = Actor.new
actor_2["name"] = "Michael Caine"
actor_2.save

actor_3 = Actor.new
actor_3["name"] = "Liam Neeson"
actor_3.save

actor_4 = Actor.new
actor_4["name"] = "Katie Holmes"
actor_4.save

actor_5 = Actor.new
actor_5["name"] = "Gary Oldman"
actor_5.save

actor_6 = Actor.new
actor_6["name"] = "Heath Ledger"
actor_6.save

actor_7 = Actor.new
actor_7["name"] = "Aaron Eckhart"
actor_7.save

actor_8 = Actor.new
actor_8["name"] = "Maggie Gyllenhaal"
actor_8.save

actor_9 = Actor.new
actor_9["name"] = "Tom Hardy"
actor_9.save

actor_10 = Actor.new
actor_10["name"] = "Joseph Gordon-Levitt"
actor_10.save

actor_11 = Actor.new
actor_11["name"] = "Anne Hathaway"
actor_11.save


# Adds in data to the role tables, after naming actors for foreign keys 
actor1 = Actor.find_by({ "name" => "Christian Bale" })
actor2 = Actor.find_by({ "name" => "Michael Caine" })
actor3 = Actor.find_by({ "name" => "Liam Neeson" })
actor4 = Actor.find_by({ "name" => "Katie Holmes" })
actor5 = Actor.find_by({ "name" => "Gary Oldman" })
actor6 = Actor.find_by({ "name" => "Heath Ledger" })
actor7 = Actor.find_by({ "name" => "Aaron Eckhart" })
actor8 = Actor.find_by({ "name" => "Maggie Gyllenhaal" })
actor9 = Actor.find_by({ "name" => "Tom Hardy" })
actor10 = Actor.find_by({ "name" => "Joseph Gordon-Levitt" })
actor11 = Actor.find_by({ "name" => "Anne Hathaway" })


role_1 = Role.new
role_1["character_name"] = "Bruce Wayne"
role_1["movie_id"] = movie1["id"]
role_1["actor_id"] = actor1["id"]
role_1.save

role_2 = Role.new
role_2["character_name"] = "Alfred"
role_2["movie_id"] = movie1["id"]
role_2["actor_id"] = actor2["id"]
role_2.save

role_3 = Role.new
role_3["character_name"] = "Ra's Al Ghul"
role_3["movie_id"] = movie1["id"]
role_3["actor_id"] = actor3["id"]
role_3.save

role_4 = Role.new
role_4["character_name"] = "Rachel Dawes"
role_4["movie_id"] = movie1["id"]
role_4["actor_id"] = actor4["id"]
role_4.save

role_5 = Role.new
role_5["character_name"] = "Commissioner Gordon"
role_5["movie_id"] = movie1["id"]
role_5["actor_id"] = actor5["id"]
role_5.save

role_6 = Role.new
role_6["character_name"] = "Bruce Wayne"
role_6["movie_id"] = movie2["id"]
role_6["actor_id"] = actor1["id"]
role_6.save

role_7 = Role.new
role_7["character_name"] = "Joker"
role_7["movie_id"] = movie2["id"]
role_7["actor_id"] = actor6["id"]
role_7.save

role_8 = Role.new
role_8["character_name"] = "Harvey Dent"
role_8["movie_id"] = movie2["id"]
role_8["actor_id"] = actor7["id"]
role_8.save

role_9 = Role.new
role_9["character_name"] = "Alfred"
role_9["movie_id"] = movie2["id"]
role_9["actor_id"] = actor2["id"]
role_9.save

role_10 = Role.new
role_10["character_name"] = "Rachel Dawes"
role_10["movie_id"] = movie2["id"]
role_10["actor_id"] = actor8["id"]
role_10.save

role_11 = Role.new
role_11["character_name"] = "Bruce Wayne"
role_11["movie_id"] = movie3["id"]
role_11["actor_id"] = actor1["id"]
role_11.save

role_12 = Role.new
role_12["character_name"] = "Commissioner Gordon"
role_12["movie_id"] = movie3["id"]
role_12["actor_id"] = actor5["id"]
role_12.save

role_13 = Role.new
role_13["character_name"] = "Bane"
role_13["movie_id"] = movie3["id"]
role_13["actor_id"] = actor9["id"]
role_13.save

role_14 = Role.new
role_14["character_name"] = "John Blake"
role_14["movie_id"] = movie3["id"]
role_14["actor_id"] = actor10["id"]
role_14.save

role_15 = Role.new
role_15["character_name"] = "Selina Kyle"
role_15["movie_id"] = movie3["id"]
role_15["actor_id"] = actor11["id"]
role_15.save



# Data sanity checks
puts "There are #{Studio.all.count} studios"
puts WarnerBros.inspect
puts movie_1.inspect
puts movie_2.inspect
puts movie_3.inspect

puts Actor.inspect
puts actor_1.inspect
puts actor_9.inspect
puts role_1.inspect
puts role_1.inspect
puts "---"
puts "---"
puts "---"


# caine_roles = Role.where({
#     "character_name" => "Alfred"
# })

# for relevantroles in caine_roles
#     charname = relevantroles[charname]
#     puts "#{charname}"
# end


bruce_roles = Role.where({"character_name" => "Bruce Wayne"})
puts bruce_roles.inspect 

for role in bruce_roles
    name = role["character_name"]
    puts "#{name}""
end





