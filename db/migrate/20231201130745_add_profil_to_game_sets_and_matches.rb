class AddProfilToGameSetsAndMatches < ActiveRecord::Migration[7.1]
  def change
    add_reference :game_sets, :winner, foreign_key: {to_table: :profils, column: :id}
    add_reference :game_sets, :looser, foreign_key: {to_table: :profils, column: :id}
    add_reference :matches, :winner, foreign_key:  {to_table: :profils, column: :id}
    add_reference :matches, :looser, foreign_key: {to_table: :profils, column: :id}
  end
end
