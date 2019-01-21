require 'rest-client'
require 'json'
require 'pry'

# search for the charcter name using API, return JSON info for that character
def get_character_data(character_name)
  response_string = RestClient.get("http://www.swapi.co/api/people/?search=#{character_name}")
  JSON.parse(response_string.body)
end

# return the url of films from the JSON information
def get_character_movies_from_api(character_hash)
  return character_hash["results"][0]["films"]
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
