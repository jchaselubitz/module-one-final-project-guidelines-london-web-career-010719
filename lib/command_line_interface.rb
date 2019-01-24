# def welcome
#   puts "Welcome to the best Bar in the World!"
# end

#---------------------Main Menu--------------------

def main_menu_new_customer
  sleep 0.5
  puts ""
  prompt = TTY::Prompt.new
  response = prompt.select("") do |menu|
    menu.choice "Search for Drink"
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

def main_menu
  sleep 0.5
  puts ""
  prompt = TTY::Prompt.new
  response = prompt.select("") do |menu|
    menu.choice 'Have my regular'
    menu.choice 'Search for Drink'
    menu.choice 'Ask Bartender'
    menu.choice 'Leave Bar'
  end
  puts "-----------------------------"
  case response
  when 'Have my regular'
    have_regular
  when 'Search for Drink'
    get_user_drink
  when 'Ask Bartender'
    ask_bartender
  when 'Leave Bar'
    leave_bar
  end
end

#---------------------Drinks Selection--------------------

def have_regular
  drink_name = @@session_user.regular
  drink_hash = get_drink_hash_by_name(drink_name)
  create_cocktail(drink_name, drink_hash)
end

def get_user_drink
  puts "What drink would you like? (search)".print_slowly
  user_drink = gets.strip.downcase
  drink_hash = get_drink_hash_by_name(user_drink)
  if drink_hash != {"drinks"=>nil}
    drink_name = get_drink_name_from_api(drink_hash)
	  puts ""
	  puts "#{drink_name} is an excellent choice! do you want to know anything about this?".print_slowly
	  drinks_options(drink_name, drink_hash)
  else
    puts ""
    sleep 0.5
	  puts "Sorry buddy, there is no such drink.".print_slowly
  end
end

#---------------------Drinks Options--------------------

def drinks_options(drink_name, drink_hash)
sleep 1
puts ""
prompt = TTY::Prompt.new
response = prompt.select("") do |menu|
menu.choice "No, just give me the #{drink_name}"
menu.choice 'See ingredients'
menu.choice 'See how its made'
menu.choice 'See drink catagory'
menu.choice 'Choose a different drink'
menu.choice 'Ask the bartender a question'
end
puts "-----------------------------"
  case response
  when "No, just give me the #{drink_name}"
    create_cocktail(drink_name, drink_hash)
  when 'See ingredients'
    ingredients = get_drink_ingredients_from_api(drink_hash)
    ingredients.each do |p|
      p.print_slowly
    end
    drinks_options(drink_name, drink_hash)
  when 'See how its made'
    instructions = get_drink_instructions_from_api(drink_hash)
    puts instructions.print_slowly
    drinks_options(drink_name, drink_hash)
  when 'See drink catagory'
    catagory = get_drink_catagory_from_api(drink_hash)
    puts catagory.print_slowly  
    drinks_options(drink_name, drink_hash)
  when 'Choose a different drink'
    get_user_drink
  when "Ask the bartender a question"
    ask_bartender
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
    puts "Wonderful, here is your #{drink_name}:"
    puts ""
    Catpix::print_image get_drink_image_from_api(drink_hash),
    :limit_x => 0.4,
    :limit_y => 0,
    :center_x => false,
    :center_y => true,
    :bg => "black",
    :bg_fill => true,
    :resolution => "high"
    puts ""
    puts "Enjoy!"
    puts "==================================="
    main_menu
end

def create_ingredients(id, ingredients)
  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient, drink_id: id)
  end
end


#---------------------Ask Bartender--------------------

def ask_bartender
  sleep 0.5
      puts ""
        prompt = TTY::Prompt.new
        response = prompt.select("") do |menu|
        menu.choice "What was my last drink?"
        menu.choice "What's the most popular drink?"
        menu.choice "What's the least popular drink?"
        menu.choice "Would you like to hear a joke?"
        menu.choice 'No more questions??'
      end
      puts "-----------------------------"
        case response
    when "What was my last drink?"
      puts @@session_user.last_drink.print_slowly
      ask_bartender
    when "What's the most popular drink?"
      puts Cocktail.most_popular
      ask_bartender
    when "What's the least popular drink?"
      puts Cocktail.least_popular
      ask_bartender
    when "Would you like to hear a joke?"
      joke_array = [
        "An SEO expert walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol",
        "How does a computer get drunk?...      It takes screenshots.",
        "Forget about the past, you can't change it. Forget about the future, you can't predict it.Forget about the present, I didn't get you one.",
        "What do you call a grilled cheese sandwich that gets right up in your face? Too close for comfort food."
      ]
    output = joke_array[rand(0..joke_array.length)]
    output.print_slowly
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
