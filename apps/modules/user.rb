class User < ActiveRecord::Base
    has_many :cocktails
    has_many :ingredients, through: :cocktails


    def drinks
      Cocktail.all.select do |drink|
        self.id == drink.user_id
      end
    end

    def last_drink
      self.drinks.last.name
    end
end
