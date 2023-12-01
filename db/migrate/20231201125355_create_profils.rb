class CreateProfils < ActiveRecord::Migration[7.1]
  def change
    create_table :profils do |t|
      t.string :startgg_id, null: false
      t.string :remote_name, null: false
      t.string :remote_team, null: true 

      t.timestamps
    end
  end
end
