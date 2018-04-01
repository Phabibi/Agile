class FixPlayersColumns < ActiveRecord::Migration[5.1]
  def change

    add_column :players, :last_name, :string
    add_column :players, :password, :string

    # Changing columns types to string (for small text input)
    change_column :players, :title, :string
    change_column :players, :text, :string

    # Renaming columns title and text
    change_table :players do |t|
      t.rename :title, :first_name
      t.rename :text, :email
    end

  end
end
