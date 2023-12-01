class AddTeamToProfilsAndPlayers < ActiveRecord::Migration[7.1]
  def change
    add_reference :profils, :team, foreign_key: true
    add_reference :players, :team, foreign_key: true
  end
end
