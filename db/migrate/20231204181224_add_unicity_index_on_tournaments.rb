class AddUnicityIndexOnTournaments < ActiveRecord::Migration[7.1]
  def change
    add_index :tournaments, [:startgg_event_id, :startgg_tournament_id], unique: true
  end
end
