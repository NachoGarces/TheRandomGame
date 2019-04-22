class AddOmniauthToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :provider, :string
    add_column :players, :uid, :string
  end
end
