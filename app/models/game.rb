class Game < ApplicationRecord
  has_many :tournaments
  has_many :games_platforms
  has_many :platforms, through: :games_platforms
  accepts_nested_attributes_for :games_platforms
end
