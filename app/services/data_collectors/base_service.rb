class DataCollectors::BaseService
  def self.call
    new.call
  end

  def call
    tournaments.each do |tournament|
      result = api_wrapper.call(**api_args(tournament, 1))
      persist(**persist_args(result: result, tournament: tournament))
      2.upto(max_page(result)) do |page|
        result = api_wrapper.call(**api_args(tournament, page))
        persist(**persist_args(result: result, tournament: tournament))
      end
    end
  end

  def tournaments
    Tournament.all
  end

  def api_args(tournament, page)
    {}
  end

  def api_wrapper
  end

  def max_page(result)
    1
  end

  def persist_args(result:, tournament:)
    {}
  end

  def persist(**args)
  end
end
