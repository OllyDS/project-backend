class CreateUserGames < ActiveRecord::Migration[5.2]
  def change
    create_table :user_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.boolean :artist
      t.integer :lives, default: 3

      t.timestamps
    end
  end
end
