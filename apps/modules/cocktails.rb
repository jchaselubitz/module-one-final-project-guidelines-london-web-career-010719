class Cocktails < ActiveRecord::Base
    belongs_to :user
    has_many :ingredients
end