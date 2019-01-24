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

    def my_most_common_ingredient

          total_list =  self.ingredients.all.map{|x| x.name}
          freq = total_list.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
          outcome = total_list.max_by { |v| freq[v] }
          qty = freq.max_by { |v,h| freq[h] }
      puts "#{outcome}, you have used it a total of #{qty.second} times!".print_slowly


    end

end
