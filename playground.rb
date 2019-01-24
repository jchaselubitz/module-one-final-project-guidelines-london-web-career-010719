# how do I search for drinks using a list of ingredients? 

def self.by_user(user)
    scope :individual_user, -> { where("drink_id = ?",drink) }
    most_frequently_used = individual_user.group(:name).order('count_id DESC').limit(1).count(:id)
    "#{most_frequently_used.keys}"
    most_frequently_ordered.keys
  end


def get_user_ingredients(session_user)
    user_ingredients = []
    user_ingredients = session_user.drinks.map do |drink|
        drink_id = drink.id
        Ingredient.drink_id
    end
    user_ingredients.mode
end

