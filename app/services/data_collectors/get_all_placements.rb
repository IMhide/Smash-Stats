class DataCollectors::GetAllPlacements < DataCollectors::BaseService
  def api_args(tournament, page)
    {event_id: tournament.startgg_event_id, page: page}
  end

  def api_wrapper
    StartGg::GetParticipants
  end

  def max_page(result)
    result.data.event.standings.page_info.total_pages
  end

  def persist_args(result:, tournament:)
    {standings: result.data.event.standings.nodes, tournament_id: tournament.id}
  end

  def persist(standings:, tournament_id:)
    standings.each do |standing|
      profil = Profil.find_or_create_by(startgg_id: standing.entrant.participants.first.id) do |profil|
        profil.startgg_id = standing.entrant.participants.first.id
        profil.remote_name = standing.entrant.participants.first.gamer_tag
        profil.remote_team = standing.entrant.participants.first.prefix
        profil.create_player(name: standing.entrant.participants.first.gamer_tag)
      end
      profil.save
      Participation.create!(tournament_id: tournament_id,
        profil: profil,
        placement: standing.placement,
        seed: standing.entrant.initial_seed_num,
        verified: standing.entrant.participants.first.verified,
        dq: !!standing.entrant.is_disqualified)
    end
  end
end
