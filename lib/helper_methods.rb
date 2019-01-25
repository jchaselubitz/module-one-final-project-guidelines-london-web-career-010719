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
          puts "Ok.".print_slowly
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
      "I'm not that kind of barman sucker ╭∩╮( ͡° ͜ʖ ͡°)╭∩╮",
      "99 bugs in the code. Take one down, pass it around, 483 little bugs in the code.",
      "What's an object-oriented way to become wealthy? Inheritance."
    ]
    output = joke_array[rand(0..joke_array.length-1)]
    output.print_slowly
  end
