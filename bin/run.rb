#!/usr/bin/env ruby
require 'pry'
require 'asciiart'
require 'rmagick'
require 'tty-prompt'
require 'catpix'
require 'artii'
require 'rainbow'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"
require_relative "../lib/welcome_routine.rb"
require_relative "../lib/helper_methods.rb"
require_relative '../config/environment'
require_relative "../apps/modules/user.rb"
require_relative "../apps/modules/cocktail.rb"
require_relative "../apps/modules/ingredient.rb"
require_relative "../playground.rb"


def run
welcome
get_user_name
main_menu
end


run
