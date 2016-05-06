class ChangeStatusColumnInRelationshipsToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :relationships, :status, :boolean, default: false
  end
end
