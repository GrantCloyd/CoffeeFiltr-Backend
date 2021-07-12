class User < ActiveRecord::Base
   
    has_many :favorites
    has_many :likes
    has_many :preferences
    has_many :reviews
    has_many :beverages, through: :favorites
    has_many :reviewed_beverages, through: :reviews, source: :beverage
    has_many :ingredients, through: :preferences

end