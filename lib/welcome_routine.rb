

#---------------------Start new program--------------------

def welcome
  puts "Welcome to the best Bar in the World!"
end

# gets user name
def get_user_name
  puts "please enter your full name"
  full_name = gets.strip.capitalize
  full_name_split = full_name.split
  first_name = full_name_split.first
  # binding.pry
  check_if_full_name(full_name, full_name_split, first_name)
end

  # check if name is two or more words long
def check_if_full_name(full_name, full_name_split, first_name)
  if full_name_split.length > 1
    check_name_in_database(full_name, first_name)
  else
    puts "Give me your full name jackass!"
    get_user_name
  end
end


def check_name_in_database(full_name, first_name)
  # check if name exists in database
  if !!User.find_by(full_name: full_name)
    # if true, assigns @@session_user to that instance in the database
    @@session_user = User.find_by(full_name: full_name)
    puts "Welcome back #{@@session_user.name}, how can I help you?"
    main_menu
  else
    #if false, creates a new user and assigns it to @@session_user
    @@session_user = User.create(name: first_name, full_name: full_name )
    puts "Hello #{@@session_user.name}, You're NEW"
    main_menu
  end
end
