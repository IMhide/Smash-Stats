class CreateGameSets < ActiveRecord::Migration[7.1]
  def change
    create_table :game_sets do |t|
      t.integer :winner_score, null: false
      t.integer :looser_score, null: false
      t.string :stage, null: true 
      t.string :winner_character, null: true
      t.string :looser_character, null: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
