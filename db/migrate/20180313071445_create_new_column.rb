class CreateNewColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :territories,:area,:float
  end
end
