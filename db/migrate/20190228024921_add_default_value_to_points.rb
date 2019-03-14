class AddDefaultValueToPoints < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :points, :integer, default: '0'
  end
end
