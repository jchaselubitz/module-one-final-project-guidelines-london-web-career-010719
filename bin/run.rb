#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"
require_relative '../config/environment'


def run
welcome
user = get_user_name
drink_name = get_user_drink(user)
drink_data = get_drink_data(drink_name)

drink_data
binding.pry
# movies_list = get_character_movies_from_api(character_info)
# movies_info_hash = get_film_info_for_film(movies_list)
# print_movies(movies_info_hash)
end

run
