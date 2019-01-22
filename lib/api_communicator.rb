# require 'rest-client'
# require 'json'
# require 'pry'

# search for the drink name using API, return JSON info for that drink
def get_drink_hash_by_name(user_drink)
  response_string = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{user_drink}")
  JSON.parse(response_string.body)
end

# return the name of the drink from the JSON information
def get_drink_name_from_api(drink_hash)
  return drink_hash["drinks"][0]["strDrink"]
end

# return the ID of the drink from the JSON information
def get_drink_ID_from_api(drink_hash)
  return drink_hash["drinks"][0]["idDrink"]
end

# return the catagory of the drink from the JSON information
def get_drink_catagory_from_api(drink_hash)
  return drink_hash["drinks"][0]["strIBA"]
end

# return the instructions of the drink from the JSON information
def get_drink_ID_from_api(drink_hash)
  return drink_hash["drinks"][0]["strInstructions"]
end


#go through each link, push the resulting JSON parse into an array
def get_film_info_for_film(film_links)
  all_films = []
  film_links.each do |link|
  response_string = RestClient.get link
  all_films << JSON.parse(response_string)
  end
  all_films
end

#go through each of the film arrays, pull out data and present in correct format
def print_movies(movies_info_hash)
   movies_info_hash.each do |movie|
    movie.each do |attributes, info|
      case attributes
       when "title"
         puts "-------------------------------"
         puts "Title: #{info}"
       when "episode_id"
         puts "Episode: #{info}"
       when "director"
         puts "Directed By: #{info}"
       when "producer"
         puts "Produced By: #{info}"
       when "release_date"
         puts "Released: #{info}"
       else
       end
     end
    end
  end
