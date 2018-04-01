class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.text :title
      t.text :text

      t.timestamps
    end
  end
end
