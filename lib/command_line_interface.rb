# def welcome
#   puts "Welcome to the best Bar in the World!"
# end

#---------------------Main Menu--------------------

def main_menu
  puts ""
  prompt = TTY::Prompt.new
  response = prompt.select("") do |menu|
  menu.choice 'Search for Drink'
  menu.choice 'Ask Bartender'
  menu.choice 'Leave Bar'
end
puts "-----------------------------"
  case response
  when 'Search for Drink'
    get_user_drink
  when 'Ask Bartender'
    ask_bartender
  when 'Leave Bar'
    leave_bar
  end
end

#---------------------Drinks Selection--------------------

def get_user_drink
  puts "what drink would you like? (search)".print_slowly
  user_drink = gets.strip.downcase
  drink_hash = get_drink_hash_by_name(user_drink)
  drink_name = get_drink_name_from_api(drink_hash)
  puts ""
  puts "#{drink_name} is an excellent choice! do you want to know anything about this?".print_slowly
  drinks_options(drink_name, drink_hash)
end

#---------------------Drinks Options--------------------

def drinks_options(drink_name, drink_hash)
puts ""
prompt = TTY::Prompt.new
response = prompt.select("") do |menu|
menu.choice 'Select this drink'
menu.choice 'See ingredients'
menu.choice 'See how its made'
menu.choice 'See drink catagory'
menu.choice 'Choose a different drink'
end
puts "-----------------------------"
  case response
  when 'Select this drink'
    create_cocktail(drink_name, drink_hash)
    puts "Wonderful, here is your #{drink_name}: #put picture here"
    main_menu
  when 'See ingredients'
    ingredients = get_drink_ingredients_from_api(drink_hash)
    puts ingredients
    drinks_options(drink_name, drink_hash)
  when 'See how its made'
    instructions = get_drink_instructions_from_api(drink_hash)
    puts instructions
    drinks_options(drink_name, drink_hash)
  when 'See drink catagory'
    catagory = get_drink_catagory_from_api(drink_hash)
    puts catagory
    drinks_options(drink_name, drink_hash)
  when 'Choose a different drink'
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
        prompt = TTY::Prompt.new
        response = prompt.select("") do |menu|
        menu.choice "What was my last drink?"
        menu.choice "What's the most popular drink?"
        menu.choice "What's the least popular drink?"
        menu.choice 'No more questions??'
      end
      puts "-----------------------------"
        case response
    when "What was my last drink?"
      @@session_user.last_drink
      ask_bartender
    when "What's the most popular drink?"
      puts Cocktail.most_popular
      ask_bartender
    when "What's the least popular drink?"
      puts Cocktail.least_popular
      ask_bartender
    when 'No more questions??'
      main_menu
  end
end


#---------------------leave bar--------------------

def leave_bar
puts "See ya!".print_slowly
exit
end
