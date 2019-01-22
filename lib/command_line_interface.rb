# def welcome
#   puts "Welcome to the best Bar in the World!"
# end


#---------------------Start new program--------------------
def get_user_name
  puts "Welcome to the best Bar in the World!"
  puts "please enter your name"
  @@session_user = User.create(name: gets.strip)
  # binding.pry
  puts "Hello #{@@session_user.name}, how can I help you?"
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
    create_cocktail_details(drink_name, drink_hash)
  when 5
    get_user_drink
  end
end

def create_cocktail_details(drink_name, drink_hash)
idDrink = get_drink_ID_from_api(drink_hash)
catagory = get_drink_catagory_from_api(drink_hash)
ingredients = get_drink_ingredients_from_api(drink_hash)
instructions = get_drink_instructions_from_api(drink_hash)
create_cocktail(drink_name, idDrink, catagory, instructions, ingredients)
end


def create_cocktail(drink_name, idDrink, catagory, instructions, ingredients)
  user_drink = Cocktail.create(name: drink_name, user_id: @@session_user.id, idDrink: idDrink, strIBA: catagory, strInstructions: instructions)
  create_ingredients(user_drink.id, ingredients)
end

def create_ingredients(id, ingredients)
  puts "hi!"
ingredients.each do |ingredient|
  Ingredient.create(name: ingredient, drink_id: id)
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
