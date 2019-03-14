class AddNameToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :name, :string
    add_column :players, :last_name, :string
    add_column :players, :avatar, :string
    add_column :players, :rags, :integer
    add_column :players, :points, :integer
  end
end
