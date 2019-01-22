#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"
require_relative '../config/environment'
require_relative "../apps/modules/user.rb"
require_relative "../apps/modules/cocktail.rb"
require_relative "../apps/modules/ingredient.rb"



def run
# user = get_user_name
user = get_user_name
main_menu
# user_drink = get_user_drink
# drink_hash = get_drink_hash_by_name(user_drink)
# drink_name = get_drink_name_from_api(drink_hash)
# drink_id = get_drink_ID_from_api(drink_hash)
# drink_catagory = get_drink_catagory_from_api(drink_hash)
# drink_instructions = get_drink_instructions_from_api(drink_hash)
# drink_ingredients = get_drink_ingredients_from_api(drink_hash)
#
#
# drink_ingredients
# binding.pry
# # movies_list = get_character_movies_from_api(character_info)
# # movies_info_hash = get_film_info_for_film(movies_list)
# # print_movies(movies_info_hash)
end

run
