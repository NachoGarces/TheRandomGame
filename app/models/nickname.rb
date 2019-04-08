class Nickname < ApplicationRecord
  belongs_to :player
  belongs_to :site
end
