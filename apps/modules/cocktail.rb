class Cocktail < ActiveRecord::Base
    belongs_to :user
    has_many :ingredients

  def self.most_popular
    pophash = group(:name).order('count_id DESC').limit(1).count(:id)
    return "the #{pophash.keys.first} is the most popular, it has been ordered #{pophash.values.first} times! The kids love it"
  end

  def self.least_popular
    pophash = group(:name).order('count_id ASC').limit(1).count(:id)
    if pophash.values.first > 1
      return "the #{pophash.keys.first} is the least popular, it has only been ordered #{pophash.values.first} times! TBH it tastes like dirt"
    else
      return "the #{pophash.keys.first} is the least popular, it has only been ordered #{pophash.values.first} time! And that person spit it out!"
    end
  end
  
  # def self.most_popular_by_user(id_of_user)
  #   user_pop_hash = includes(user_id: id_of_user).group(:name).order('count_id DESC').limit(1).count(:id)
  #   puts "One #{user_pop_hash.keys.first} coming right up"
  # end 

  #binding.pry


end

 

