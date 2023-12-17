class CreateParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :participations do |t|
      t.references :tournament, null: false, foreign_key: true
      t.references :profil, null: false, foreign_key: false 
      t.integer :placement, null: false
      t.integer :seed, null: false
      t.boolean :verified, null: false, default: false
      t.boolean :dq, null: false, default: false

      t.timestamps
    end
  end
end
