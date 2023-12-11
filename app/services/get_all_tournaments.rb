class GetAllTournaments
  def call
    result = StartGg::GetTournaments.call
    max_page = result.data.tournaments.page_info.total_pages
    persist_tournaments(result.data.tournaments.nodes)
    2.upto(max_page) do |page|
      result = StartGg::GetTournaments.call(page: page)
      persist_tournaments(result.data.tournaments.nodes)
    end
  end

  private

  def persist_tournaments(tournaments)
    tournament_batch = tournaments.map do |tournament|
      tournament.events.select { |e| e.state == 'COMPLETED' }.map do |event|
        {
          name: tournament.name,
          startgg_tournament_id: tournament.id,
          startgg_event_id: event.id,
          startgg_slug: tournament.slug,
          happened_at: Time.at(event.start_at).to_datetime,
          country_code: tournament.country_code,
          state: tournament.addr_state,
          venue_name: tournament.venue_name,
          zipcode: tournament.postal_code,
          address: tournament.venue_address,
          is_online: event.is_online,
          event_name: event.name
        }
      end
    end
    Tournament.insert_all(tournament_batch.flatten)
  end
end
