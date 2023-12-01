class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :winner_score, null: false
      t.integer :looser_score, null: false
      t.datetime :completed_at, null: false

      t.timestamps
    end
  end
end
