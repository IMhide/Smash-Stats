class GetAllMatchesJob
  include Sidekiq::Job

  def perform(*args)
    Tournament.waiting.each do |tournament|
      ActiveRecord::Base.transaction do
        DataCollectors::GetAllMatches.call(tournament: tournament)
        tournament.update(status: 'synced')
      end
    end
  end
end
