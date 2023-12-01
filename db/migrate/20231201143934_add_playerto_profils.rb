class AddPlayertoProfils < ActiveRecord::Migration[7.1]
  def change
    add_reference :profils, :player, foreign_key: true
  end
end
