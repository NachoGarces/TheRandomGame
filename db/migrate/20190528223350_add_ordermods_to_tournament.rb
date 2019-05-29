class AddOrdermodsToTournament < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :ordermods, :integer, array: true, default: []
  end
end
