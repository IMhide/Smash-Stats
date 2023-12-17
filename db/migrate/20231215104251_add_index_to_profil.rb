class AddIndexToProfil < ActiveRecord::Migration[7.1]
  def change
    add_index :profils, :startgg_id, unique: true
  end
end
