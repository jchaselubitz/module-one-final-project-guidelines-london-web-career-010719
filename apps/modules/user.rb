class User < ActiveRecord::Base
    has_many :cocktails
    has_many :ingredients, through: :cocktails


    def drinks
      Cocktail.all.select do |drink|
        self.id == drink.user_id
      end
    end

    def last_drink
      if !!self.drinks.last
        self.drinks.last.name
      else
        text = "Don't be silly. You've never been here before."
        puts text.print_slowly
      end
    end

end
