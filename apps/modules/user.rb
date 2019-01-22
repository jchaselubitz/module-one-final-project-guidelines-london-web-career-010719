class User < ActiveRecord::Base
    has_many :cocktails
    has_many :ingredients, through: :cocktails
end
