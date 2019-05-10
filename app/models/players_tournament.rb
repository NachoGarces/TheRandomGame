class PlayersTournament < ApplicationRecord
  belongs_to :tournament
  belongs_to :player

  validate :amounts_rags_to_bet

  private
  def amounts_rags_to_bet
    if self.player.rags < self.tournament.bet_amounts
      
    end
  end
end
