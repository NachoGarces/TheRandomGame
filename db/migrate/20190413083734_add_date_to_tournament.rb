class AddDateToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :date, :datetime
  end
end
