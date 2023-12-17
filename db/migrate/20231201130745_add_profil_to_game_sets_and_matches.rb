class AddProfilToGameSetsAndMatches < ActiveRecord::Migration[7.1]
  def change
    add_reference :game_sets, :winner, foreign_key: false 
    add_reference :game_sets, :looser, foreign_key: false
    add_reference :matches, :winner, foreign_key: false
    add_reference :matches, :looser, foreign_key: false
  end
end
