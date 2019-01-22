# def welcome
#   puts "Welcome to the best Bar in the World!"
# end

def get_user_name
  puts "Welcome to the best Bar in the World!"
  puts "please enter your name"
  username = gets.strip
  puts "Hello #{username}!"
  username
end

def create_user_instance
   user = get_user_name
   user = User.new(name: user)
   user.save
   binding.pry
end

def get_user_drink(user)
  puts "what drink would you like?"
  gets.strip.downcase
end
