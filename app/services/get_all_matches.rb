class GetAllMatches
  def call
    Tournament.waiting.each do |tournament|
      result = StartGg::GetMatches.call(event_id: tournament.startgg_event_id)
      max_page = result.data.event.sets.page_info.total_pages
      persist(sets: result.data.event.sets.nodes, tournament_id: tournament.id)
      2.upto(max_page) do |page|
        puts "Loop Numero #{page}"
        result = StartGg::GetMatches.call(event_id: tournament.startgg_event_id, page: page)
        persist(sets: result.data.event.sets.nodes, tournament_id: tournament.id)
      end
    end
  end

  def persist(sets:, tournament_id:)
    matches_hash = sets.map do |set|
      {
        tournament_id: tournament_id,
        completed_at: Time.at(set.completed_at).to_datetime,
        round_text: set.full_round_text,
        game_sets_attributes: get_game_set(set: set) || []
      }.merge(get_looser_info(set: set, winner_id: set.winner_id))
        .merge(get_winner_info(set: set, winner_id: set.winner_id))
    end
    Match.create!(matches_hash)
  end

  def get_game_set(set:)
    set.games&.map do |game|
      {
        stage: game.stage&.name
      }.merge(get_winner_set_info(game: game, winner_id: game.winner_id))
        .merge(get_looser_set_info(game: game, winner_id: game.winner_id))
    end
  end

  def get_winner_set_info(game:, winner_id:)
    winner_info = game.selections.find { |selection| selection.entrant.id == winner_id.to_s }
    {
      winner_score: 0,
      winner_character: winner_info.character.name,
      winner_id: winner_info.entrant.participants.first.id
    }
  end

  def get_looser_set_info(game:, winner_id:)
    looser_info = game.selections.find { |selection| selection.entrant.id != winner_id.to_s }
    {
      looser_score: 0,
      looser_character: looser_info.character.name,
      looser_id: looser_info.entrant.participants.first.id
    }
  end

  def get_looser_info(set:, winner_id:)
    looser_slot = set.slots.find { |slot| slot.entrant.id != winner_id.to_s }
    {
      looser_score: looser_slot.standing.stats.score.value.to_i,
      looser_id: looser_slot.entrant.participants.first.id
    }
  end

  def get_winner_info(set:, winner_id:)
    winner_slot = set.slots.find { |slot| slot.entrant.id == winner_id.to_s }
    {
      winner_score: winner_slot.standing.stats.score.value.to_i,
      winner_id: winner_slot.entrant.participants.first.id
    }
  end
end
