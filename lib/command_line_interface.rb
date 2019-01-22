# def welcome
#   puts "Welcome to the best Bar in the World!"
# end


#---------------------Start new program--------------------
def get_user_name
  puts "Welcome to the best Bar in the World!"
  puts "please enter your name"
  @@session_user = User.create(name: gets.strip.capitalize)
  # binding.pry
  puts "Hello #{@@session_user.name}, how can I help you?"
end

#---------------------Main Menu--------------------

def main_menu
puts ""
puts "1| Search for Drink"
puts "2| Ask Bartender"
puts "3| Leave Bar"
puts "-----------------------------"
user_selection = gets.strip.to_i
  case user_selection
  when 1
    get_user_drink
  when 2
    ask_bartender
  when 3
    leave_bar
  end
end

#---------------------Drinks Selection--------------------

def get_user_drink
  puts "what drink would you like? (search)"
  user_drink = gets.strip.downcase
  drink_hash = get_drink_hash_by_name(user_drink)
  drink_name = get_drink_name_from_api(drink_hash)
  puts ""
  puts "#{drink_name} is an excellent choice! do you want to know anything about this?"
  drinks_options(drink_name, drink_hash)
end

#---------------------Drinks Options--------------------

def drinks_options(drink_name, drink_hash)
puts ""
puts "1| See ingredients"
puts "2| See how its made"
puts "3| See drink catagory"
puts "4| Select this drink"
puts "5| Choose a different drink"
puts "-----------------------------"
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
    create_cocktail(drink_name, drink_hash)
    puts "Wonderful, here is your #{drink_name}: #put picture here"
    main_menu
  when 5
    get_user_drink
  end
end


def create_cocktail(drink_name, drink_hash)
  user_drink = Cocktail.create(
    name: drink_name, 
    user_id: @@session_user.id, 
    idDrink: get_drink_ID_from_api(drink_hash), 
    strIBA: get_drink_catagory_from_api(drink_hash), 
    strInstructions: get_drink_instructions_from_api(drink_hash)
  )
  create_ingredients(
    user_drink.id, 
    get_drink_ingredients_from_api(drink_hash)
    )
end

def create_ingredients(id, ingredients)
  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient, drink_id: id)
  end
end


#---------------------Ask Bartender--------------------

def ask_bartender
  puts ""
  puts "1| What was my last drink?"
  puts "2| What's the most popular drink?"
  puts "3| What's the least popular drink?"
  puts "4| No more questions??"
  puts "--------------------------"
  user_selection = gets.strip.to_i
    case user_selection
    when 1
      @@session_user.last_drink
      ask_bartender
    when 2
      puts Cocktail.most_popular
      ask_bartender
    when 3
      puts Cocktail.least_popular
      ask_bartender
    when 4
      main_menu
  end
end


#---------------------leave bar--------------------

def leave_bar
puts "See ya!"
end
