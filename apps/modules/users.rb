class Users < ActiveRecord::Base
    has_many :cocktails
    has_many :ingredients, though: :cocktails
end