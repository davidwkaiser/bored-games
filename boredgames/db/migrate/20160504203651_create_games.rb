class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :play_time
      t.integer :min_players
      t.integer :max_players
      t.integer :year_published

      t.timestamps null: false
    end
  end
end
