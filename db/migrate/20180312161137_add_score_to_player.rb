class AddScoreToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players,:score,:float
  end
end
