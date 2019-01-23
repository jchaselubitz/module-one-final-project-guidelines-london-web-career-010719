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

    # def regular_order
    #   reghash = group(:name).order('count_id DESC').limit(1).count(:id)
    #   return "the #{reghash.keys.first} is the most popular, it has been ordered #{reghash.values.first} times! The kids love it"
end
