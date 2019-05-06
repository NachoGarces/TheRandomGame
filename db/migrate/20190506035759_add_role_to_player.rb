class AddRoleToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :role, :integer, default: 1
  end
end
