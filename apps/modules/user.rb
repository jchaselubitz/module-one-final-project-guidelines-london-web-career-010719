class User < ActiveRecord::Base
    has_many :cocktails
    has_many :ingredients, through: :cocktails


    def drinks
      Cocktail.all.select do |drink|
        self.id == drink.user_id
      end
    end

    def regular
      Cocktail.by_user(self.id).first
    end

    def last_drink
      if !!self.drinks.last
        self.drinks.last.name
      else
        text = "Don't be silly. You've never been here before."
        puts text.print_slowly
      end
    end

    def my_ingredients
      self.ingredients.all.group(:name).order('count_id DESC').count(:id)
    end

    def most_common_ingredient_name
      my_ingredients.first
    end

    def recommendation(session_user)
      a = get_drinks_by_ingredient
      puts "Here are some options:"
      prompt = TTY::Prompt.new
      response = prompt.select("") do |menu|
        menu.choice "#{a[0]}",1
        menu.choice "#{a[1]}",2
        menu.choice "#{a[2]}",3
        menu.choice "#{a[3]}",4
        menu.choice "I'd like more suggestions",5
        menu.choice "I am not interested in these. Let me request a new drink.",6
      end
      puts "-----------------------------"
      case response
        when 1
          drink_hash = get_drink_hash_by_name("#{a[0]}")
          create_cocktail("#{a[0]}", drink_hash,session_user) 
        when 2
          drink_hash = get_drink_hash_by_name("#{a[1]}")
          create_cocktail("#{a[1]}", drink_hash,session_user) 
        when 3
          drink_hash = get_drink_hash_by_name("#{a[2]}")
          create_cocktail("#{a[2]}", drink_hash,session_user) 
        when 4
          drink_hash = get_drink_hash_by_name("#{a[3]}")
          create_cocktail("#{a[3]}", drink_hash,session_user) 
        when 5
          recommendation(session_user)
        when 6
          get_user_drink(session_user)
      end

    end

    #puts "#{outcome.keys}, you have used it a total of #{qty.second} times!".print_slowly
    #end

    # def my_recommendation
    #   my_ingredients
end


