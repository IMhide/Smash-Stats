class CreateTournaments < ActiveRecord::Migration[7.1]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :startgg_id, null: false
      t.string :startgg_slug, null: false
      t.datetime :happened_at, null: false

      t.timestamps
    end
  end
end
