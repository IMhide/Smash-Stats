class GetAllPlacementsJob
  include Sidekiq::Job

  def perform(*args)
    Tournament.created.each do |tournament|
      ActiveRecord::Base.transaction do
        DataCollectors::GetAllPlacements.call(tournament: tournament)
        tournament.update(status: 'waiting')
      end
    end
  end
end
