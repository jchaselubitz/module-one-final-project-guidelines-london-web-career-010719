
#---------------------Main Menu--------------------
def main_menu(session_user)
  if Is_in_database.getter
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
      have_regular(session_user)
    when 'Search for Drink'
      get_user_drink(session_user)
    when 'Ask Bartender'
      ask_bartender(session_user)
    when 'Leave Bar'
      leave_bar
    end
  else
    prompt = TTY::Prompt.new
    response = prompt.select("") do |menu|
      menu.choice "Search for Drink"
      menu.choice 'Ask Bartender'
      menu.choice 'Leave Bar'
    end
    puts "-----------------------------"
    case response
    when 'Search for Drink'
      get_user_drink(session_user)
    when 'Ask Bartender'
      ask_bartender(session_user)
    when 'Leave Bar'
      leave_bar
    end
  end
end


#---------------------Drinks Selection--------------------

def have_regular(session_user)
  drink_name = session_user.regular
  drink_hash = get_drink_hash_by_name(drink_name)
  create_cocktail(drink_name, drink_hash, session_user)
end

def have_offered_drink(session_user, drink_name)
  drink_hash = get_drink_hash_by_name(drink_name)
  create_cocktail(drink_name, drink_hash, session_user)
end

def get_user_drink(session_user)
  puts "What drink would you like? (search)".print_slowly
  user_drink = gets.strip.downcase
  drink_hash = get_drink_hash_by_name(user_drink)
  if drink_hash != {"drinks"=>nil}
    drink_options = get_three_drink_names_from_api(drink_hash) #get_drink_name_from_api(drink_hash)
    #-----chooser----
    prompt = TTY::Prompt.new
    response = prompt.select("") do |menu|
      menu.choice "#{drink_options[0]}"
      if drink_options.length > 1
        menu.choice "#{drink_options[1]}"
      end
      if drink_options.length > 2
      menu.choice "#{drink_options[2]}"
      end
    end
    puts "-----------------------------"
    case response
    when "#{drink_options[0]}"
     drink_name = "#{drink_options[0]}"
    when "#{drink_options[1]}"
      drink_name = "#{drink_options[1]}"
    when "#{drink_options[2]}"
      drink_name = "#{drink_options[2]}"
    end
    #-----chooser----
    puts ""
	  puts "#{drink_name} is an excellent choice! do you want to know anything about this?".print_slowly
	  drinks_options(drink_name, drink_hash, session_user)
  else
    puts ""
    sleep 0.5
    puts "Sorry buddy, there is no such drink.".print_slowly
    get_user_drink(session_user)
  end
end

#---------------------Drinks Options--------------------

def drinks_options(drink_name, drink_hash, session_user)
sleep 1
puts ""
prompt = TTY::Prompt.new
response = prompt.select("") do |menu|
  menu.choice "No, just give me the #{drink_name}",1
  menu.choice 'See ingredients',2
  menu.choice 'See how its made',3
  menu.choice 'See drink catagory',4
  menu.choice 'Choose a different drink',5
  menu.choice 'Ask the bartender a question',6
  end
  puts "-----------------------------"
  case response
  when 1
    create_cocktail(drink_name, drink_hash , session_user)
  when 2
    ingredients = get_drink_ingredients_from_api(drink_hash)
    ingredients.each do |p|
      p.print_slowly
    end
    drinks_options(drink_name, drink_hash, session_user)
  when 3
    instructions = get_drink_instructions_from_api(drink_hash)
    puts instructions.print_slowly
    drinks_options(drink_name, drink_hash, session_user)
  when 4
    catagory = get_drink_catagory_from_api(drink_hash)
    if catagory != nil
    puts catagory.print_slowly
  else
    puts "I'm not really sure... must be some hipster drink".print_slowly
  end
    drinks_options(drink_name, drink_hash, session_user)
  when 5
    get_user_drink(session_user)
  when 6
    ask_bartender(session_user)
  end
end

#------create drink, save and print to console--------------------

def create_cocktail(drink_name, drink_hash,session_user)
  user_drink = Cocktail.create(
    name: drink_name,
    user_id: session_user.id,
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
  puts "Enjoy!".print_slowly
  puts "==================================="
  Is_in_database.setter(true)
  main_menu(session_user)
end

def create_ingredients(id, ingredients)
  ingredients.each do |ingredient|
    Ingredient.create(name: ingredient, cocktail_id: id)
  end
end


#--------------------------------Ask Bartender---------------------------------------------

def ask_bartender(session_user)
  sleep 0.5
  puts ""
  #--------when user has visited before--------
  if Is_in_database.getter
    prompt = TTY::Prompt.new
    response = prompt.select("") do |menu|
      menu.choice "What was my last drink?"
      menu.choice "Give me a drink recommendation based on ingredients I like."
      menu.choice "What's the most popular drink?"
      menu.choice "What's the least popular drink?"
      menu.choice "What's my most common ingredient?"
      menu.choice "Tell me a joke!"
      #menu.choice "Do you have any food?"
      menu.choice "I don't have any more questions."
    end
    puts "-----------------------------"
    case response
      when "What was my last drink?"
        puts session_user.last_drink.print_slowly
        drink_name = session_user.last_drink
        drink_questionnaire(session_user, drink_name)
      when "Give me a drink recommendation based on ingredients I like."
        session_user.recommendation(session_user)
        drink_questionnaire(session_user, drink_name)
      when "What's the most popular drink?"
        pophash = Cocktail.most_popular
        puts "the #{pophash.keys.first} is the most popular, it has been ordered #{pophash.values.first} times! The kids love it".print_slowly
        drink_name = "#{pophash.keys.first}"
        drink_questionnaire(session_user, drink_name)
      when "What's the least popular drink?"
        puts Cocktail.least_popular
        ask_bartender(session_user)
      when "What's my most common ingredient?"
        outcome = session_user.most_common_ingredient_name
        puts "#{outcome[0]}, you have used it a total of #{outcome[1]} times!".print_slowly
        ask_bartender(session_user)
      when "Tell me a joke!"
        joke_teller
        ask_bartender(session_user)
      when "I don't have any more questions."
        main_menu(session_user)
      # when "Do you have any food?"
      #   puts "Sure."
      #   sends to song/yannick app
    end
#--------------when new user-------------------
  else
    prompt = TTY::Prompt.new
    response = prompt.select("") do |menu|
      menu.choice "What's the most popular drink?"
      menu.choice "What's the least popular drink?"
      menu.choice "Tell me a joke!"
      menu.choice 'No more questions??'
    end
    puts "-----------------------------"
    case response
      when "What's the most popular drink?"
        pophash = Cocktail.most_popular
        puts "The #{pophash.keys.first} is the most popular, it has been ordered #{pophash.values.first} times! The kids love it".print_slowly
        drink_name = "#{pophash.keys.first}"
        drink_questionnaire(session_user, drink_name)
      when "What's the least popular drink?"
        puts Cocktail.least_popular
        ask_bartender(session_user)
      when "Tell me a joke!"
        joke_teller
        ask_bartender(session_user)
      when 'No more questions??'
        main_menu(session_user)
    end
  end
end


#---------------------leave bar--------------------

def leave_bar
puts "See ya!".print_slowly
a = AsciiArt.new("https://rlv.zcache.com/waving_hand_sign_emoji_keychain-rd21b6f025d6c49128cb33014897a829e_x7j3z_8byvr_307.jpg?rvtype=content")
puts a.to_ascii_art(width: 50)
sleep(4)
system('clear')
exit
end
