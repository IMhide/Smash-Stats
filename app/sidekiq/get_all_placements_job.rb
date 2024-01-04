class GetAllPlacementsJob
  include Sidekiq::Job

  def perform(*args)
    Tournament.created.each do |tournament|
      DataCollectors::GetAllPlacements.call(tournament: tournament)
      tournament.update(status: 'waiting')
    end
  end
end
