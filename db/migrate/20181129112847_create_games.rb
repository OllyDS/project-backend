class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :canvas
      t.integer :lives, default: 3
      t.integer :win_streak, default: 0

      t.timestamps
    end
  end
end
