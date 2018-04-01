class AddNameAttrToTerritory < ActiveRecord::Migration[5.1]
  def change
    add_column :territories, :username, :string
  end
end
