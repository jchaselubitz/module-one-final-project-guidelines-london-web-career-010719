

#---------------------Start new program--------------------

def welcome
  a = AsciiArt.new("https://svgsilh.com/svg/1419481.svg")
puts a.to_ascii_art
puts ""
"Welcome to the best bar in the World!".print_slowly
puts ""
end

# gets user name
def get_user_name
  puts "Please enter your full name:".print_slowly
  full_name = gets.strip.capitalize
  full_name_split = full_name.split
  first_name = full_name_split.first
  check_if_full_name(full_name, full_name_split, first_name)
end

  # check if name is two or more words long
def check_if_full_name(full_name, full_name_split, first_name)
  if full_name_split.length > 1
    check_name_in_database(full_name, first_name)
  else
    puts "Give me your full name, jackass!".print_slowly
    get_user_name
  end
end

# need to do something with welcome string


def check_name_in_database(full_name, first_name)
  # check if name exists in database
  if !!User.find_by(full_name: full_name)
    # if true, assigns session_user to that instance in the database
    session_user = User.find_by(full_name: full_name)
    Is_in_database.setter(true)
    puts "Welcome back #{session_user.name}, how can I help you?".print_slowly
    main_menu(session_user)
  else
    #if false, creates a new user and assigns it to session_user
    session_user = User.create(name: first_name, full_name: full_name )
    Is_in_database.setter(false)
    puts "Hello #{session_user.name}, it's wonderful to meet you".print_slowly
    main_menu(session_user)
  end
end