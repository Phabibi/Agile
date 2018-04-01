class AddColumnsToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :admin, :boolean
    add_column :players, :username, :string
  end
end
