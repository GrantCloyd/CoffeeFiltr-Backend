class Beverage < ActiveRecord::Base

    has_many :reviews
    has_many :favorites
    has_many :components
    has_many :ingredients, through: :components
    has_many :users, through: :favorites
   has_many :reviewers, through: :reviews, source: :user

end