def welcome
  puts "Welcome to the best Bar in the World!"
end

def get_user_name
  puts "please enter your name"
  User.new = gets.strip.downcase
end

def get_user_drink(user)
  puts "what drink would you like?"
  gets.strip.downcase
end
