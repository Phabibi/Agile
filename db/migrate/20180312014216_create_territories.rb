class CreateTerritories < ActiveRecord::Migration[5.1]
  def change
    create_table :territories do |t|
      t.string :coords
      t.string :time
      t.string :area
      t.float :center_lng
      t.float :center_lat
      t.integer :player_id

      t.timestamps
    end
  end
end
