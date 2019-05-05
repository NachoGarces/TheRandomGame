class Tournament < ApplicationRecord
  belongs_to :player
  belongs_to :typetournament

  has_many :players_tournaments, dependent: :delete_all
  has_many :players, through: :players_tournaments
  accepts_nested_attributes_for :players_tournaments

  belongs_to :game
  has_many :comments, :dependent => :destroy

  validate :amounts_rags_to_bet

  private
  def amounts_rags_to_bet
    if self.player.rags < self.bet_amounts
      self.errors.add(:bet_amounts, 'Rags insuficientes para realizar el torneo')
    elsif 0 > self.bet_amounts
      self.errors.add(:bet_amounts, 'Asegurate de que sea igual o superior a 10')
    end
  end
end
