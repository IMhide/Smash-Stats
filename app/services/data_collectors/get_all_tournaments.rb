class DataCollectors::GetAllTournaments < DataCollectors::BaseService
  def tournaments
    [1]
  end

  def api_wrapper
    StartGg::GetTournaments
  end

  def api_args(tournament, page)
    {page: page}
  end

  def max_page(result)
    result.data.tournaments.page_info.total_pages
  end

  def persist_args(result:, tournament:)
    {remote_tournaments: result.data.tournaments.nodes}
  end

  def persist(remote_tournaments:)
    tournament_batch = remote_tournaments.map do |tournament|
      tournament.events.select { |e| e.state == 'COMPLETED' && is_double_elimination?(e) }.map do |event|
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

  private

  def is_double_elimination?(event)
    event.phase_groups.map(&:bracket_type).all?('DOUBLE_ELIMINATION')
  end
end
