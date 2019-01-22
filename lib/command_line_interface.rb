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
  gets.strip.downcase
end









#---------------------Drinks Options--------------------










#---------------------Ask Bartender--------------------

def ask_bartender
puts "go away!"
end


#---------------------leave bar--------------------



def leave_bar
puts "See ya!"
end
