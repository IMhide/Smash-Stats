class CreateTournaments < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :startgg_event_id, null: false
      t.string :startgg_tournament_id, null: false
      t.string :startgg_slug, null: false
      t.datetime :happened_at, null: false
      t.string :country_code
      t.string :state
      t.string :venue_name
      t.string :zipcode
      t.string :address
      t.boolean :is_online, null: false


      t.timestamps
    end
  end
end
