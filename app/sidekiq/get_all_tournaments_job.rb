class GetAllTournamentsJob
  include Sidekiq::Job

  def perform(*args)
    DataCollectors::GetAllTournaments.call
  end
end
