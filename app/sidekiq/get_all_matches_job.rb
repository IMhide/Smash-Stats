class GetAllMatchesJob
  include Sidekiq::Job

  def perform(*args)
    Tournament.waiting.each do |tournament|
      DataCollectors::GetAllMatches.call(tournament: tournament)
      tournament.update(status: 'synced')
    end
  end
end
