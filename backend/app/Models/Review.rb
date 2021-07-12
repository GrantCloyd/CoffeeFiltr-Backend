class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :beverage
    has_many :likes
    has_many :likers, through: :likes, source: :user
end