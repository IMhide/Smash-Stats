class AddStateToTournament < ActiveRecord::Migration[7.1]
  def change
    create_enum :tournament_status, ["created", "waiting", "no_match", "synced"]
    add_column :tournaments, :status, :enum, default: "created", enum_type: :tournament_status, null: false
  end
end
