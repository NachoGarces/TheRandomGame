class Tournament < ApplicationRecord
  belongs_to :player
  belongs_to :typetournament
  has_and_belongs_to_many :players
end
