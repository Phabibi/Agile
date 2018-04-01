class AddRankToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :rank, :integer
  end
end
