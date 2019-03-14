class AddDefaultValueToRags < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :rags, :integer, default: '0'
  end
end
