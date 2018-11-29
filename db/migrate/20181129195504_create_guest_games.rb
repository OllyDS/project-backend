class CreateGuestGames < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_games do |t|
      t.string :canvas

      t.timestamps
    end
  end
end
