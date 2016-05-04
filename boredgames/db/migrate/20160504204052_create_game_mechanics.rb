class CreateGameMechanics < ActiveRecord::Migration
  def change
    create_table :game_mechanics do |t|
      t.integer :game_id
      t.integer :mechanic_id

      t.timestamps null: false
    end
  end
end
