class CreateMechanics < ActiveRecord::Migration
  def change
    create_table :mechanics do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
