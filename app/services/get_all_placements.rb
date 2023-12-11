class GetAllPlacements
  def call
    Tournament.created.each do |tournament|
      result = StartGg::GetParticipants.call(event_id: tournament.startgg_event_id)
      max_page = result.data.event.standings.page_info.total_pages
      persist(standings: result.data.event.standings, tournament: tournament)
      2.upto(max_page) do |page|
        result = StartGg::GetParticipants.call(event_id: tournament.startgg_event_id, page: page)
        persist(standings: result.data.event.standings, tournament: tournament)
      end
    end
  end

  private

  def persist(standings:, tournament:)
    standings.nodes.each do |standing|
      profil = Profil.find_or_create_by(startgg_id: standing.entrant.participants.first.id) do |profil|
        profil.startgg_id = standing.entrant.participants.first.id
        profil.remote_name = standing.entrant.participants.first.gamer_tag
        profil.remote_team = standing.entrant.participants.first.prefix
        profil.create_player(name: standing.entrant.participants.first.gamer_tag)
      end
      profil.save!
      Participation.create!(tournament: tournament,
        profil: profil,
        placement: standing.placement,
        seed: standing.entrant.initial_seed_num,
        verified: standing.entrant.participants.first.verified,
        dq: !!standing.entrant.is_disqualified)
    end
  end
end
