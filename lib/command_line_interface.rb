# def welcome
#   puts "Welcome to the best Bar in the World!"
# end


#---------------------Start new program--------------------
def get_user_name
  puts "Welcome to the best Bar in the World!"
  puts "please enter your name"
  user = User.create(name: gets.strip)
  # binding.pry
  puts "Hello #{user.name}, how can I help you?"
end




#---------------------Main Menu--------------------


def main_menu
puts "1| Search for Drink"
puts "2| Ask Bartender"
puts "3| Leave Bar"
user_selection = gets.strip.to_i
  case user_selection
  when 1
    get_user_drink
  when 2
    ask_bartender
  when 3
    leave_bar
  end
  # binding.pry
end


#---------------------Drinks Selection--------------------

def get_user_drink
  puts "what drink would you like?"
  user_drink = gets.strip.downcase
  drink_hash = get_drink_hash_by_name(user_drink)
  drink_name = get_drink_name_from_api(drink_hash)
  puts "#{drink_name} is an excellent choice! do you want to know anything about this?"
  drinks_options(drink_name, drink_hash)
end









#---------------------Drinks Options--------------------

def drinks_options(drink_name, drink_hash)
puts "1| See ingredients"
puts "2| See how its made"
puts "3| See drink catagory"
puts "4| Select this drink"
puts "5| Choose a different drink"
user_selection = gets.strip.to_i
  case user_selection
  when 1
    ingredients = get_drink_ingredients_from_api(drink_hash)
    puts ingredients
    drinks_options(drink_name, drink_hash)
  when 2
    instructions = get_drink_instructions_from_api(drink_hash)
    puts instructions
    drinks_options(drink_name, drink_hash)
  when 3
    catagory = get_drink_catagory_from_api(drink_hash)
    puts catagory
    drinks_options(drink_name, drink_hash)
  when 4
    drink = Cocktail.create(drink_name)# needs work
  when 5
    get_user_drink
  end
   binding.pry
end








#---------------------Ask Bartender--------------------

def ask_bartender
puts "go away!"
end


#---------------------leave bar--------------------


def leave_bar
puts "See ya!"
end
