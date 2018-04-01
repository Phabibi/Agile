class FixAreaColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :territories,:area
  end
end
