#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"
require_relative '../config/environment'


def run
welcome
user = get_user_name
user_drink = get_user_drink(user)
drink_hash = get_drink_hash_by_name(user_drink)
drink_name = get_drink_name_from_api(drink_hash)
drink_ingredients = get_drink_ingredients_from_api(drink_hash)


drink_ingredients
binding.pry
# movies_list = get_character_movies_from_api(character_info)
# movies_info_hash = get_film_info_for_film(movies_list)
# print_movies(movies_info_hash)
end

run
