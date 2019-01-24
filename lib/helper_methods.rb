class Is_in_database

    #Is_in_database.setter(value)
    #Is_in_database.getter
    def self.setter(value)
      @value = value
    end
    def self.getter
      @value 
    end
  end
  
def drink_questionnaire(session_user,drink_name)
    puts ""
    puts "Would you like the #{drink_name}?"
    prompt = TTY::Prompt.new
    response = prompt.select("") do |menu|
        menu.choice "Yes"
        menu.choice "No"
    end
    case response
        when "Yes"
        have_offered_drink(session_user, drink_name)
        when "No"
        ask_bartender(session_user)
    end
end

  
  class String
    def print_slowly
      self.each_char do |c|
        sleep 0.04
        print c
      end
      puts ""
    end
  end