class Ingredient < ActiveRecord::Base
    has_many :preferences
    has_many :components
    has_many :beverages, through: :components
    has_many :users, through: :preferences
end