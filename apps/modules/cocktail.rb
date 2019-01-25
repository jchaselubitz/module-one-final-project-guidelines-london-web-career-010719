class Cocktail < ActiveRecord::Base
    belongs_to :user
    has_many :ingredients

  def self.most_popular
    group(:name).order('count_id DESC').limit(1).count(:id)
  end

  def self.least_popular
    pophash = group(:name).order('count_id ASC').limit(1).count(:id)
    if pophash.values.first > 1
      return "The #{pophash.keys.first} is the least popular, it has only been ordered #{pophash.values.first} times! TBH it tastes like dirt".print_slowly
    else
      return "The #{pophash.keys.first} is the least popular, it has only been ordered #{pophash.values.first} time! And that person spit it out!".print_slowly
    end
  end

  def self.by_user(user)
    scope :individual_user, -> { where("user_id = ?", user) }
    most_frequently_ordered = individual_user.group(:name).order('count_id DESC').limit(1).count(:id)
    "#{most_frequently_ordered.keys}"
    most_frequently_ordered.keys
  end

end
