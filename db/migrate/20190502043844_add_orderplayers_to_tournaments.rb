class AddOrderplayersToTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournaments, :orderplayers, :integer, array: true, default: []
  end
end
