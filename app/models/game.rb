class Game < ApplicationRecord
  has_many :tournaments
  has_and_belongs_to_many :platforms
end
