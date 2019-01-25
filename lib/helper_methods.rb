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


  def joke_teller
    joke_array = [
      "An SEO expert walks into a bar, bars, pub, tavern, public house, Irish pub, drinks, beer, alcohol",
      "How does a computer get drunk?...      It takes screenshots.",
      "Forget about the past, you can't change it. Forget about the future, you can't predict it. Forget about the present, I didn't get you one.",
      "What do you call a grilled cheese sandwich that gets right up in your face? Too close for comfort food."
    ]
    output = joke_array[rand(0..joke_array.length-1)]
    output.print_slowly
  end