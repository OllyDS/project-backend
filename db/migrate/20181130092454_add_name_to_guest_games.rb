class AddNameToGuestGames < ActiveRecord::Migration[5.2]
  def change
    add_column :guest_games, :name, :string
  end
end
