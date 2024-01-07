class DataCollectors::BaseService
  RETRY = 10
  SLEEP = 10

  def self.call(tournament: nil)
    new.call(tournament: tournament)
  end

  def call(tournament:)
    result = safe_api_call(**api_args(tournament, 1))
    persist(**persist_args(result: result, tournament: tournament))
    2.upto(max_page(result)) do |page|
      result = safe_api_call(**api_args(tournament, page))
      persist(**persist_args(result: result, tournament: tournament))
    end
  end

  def api_args(tournament, page)
    {}
  end

  def api_wrapper
    raise 'Not defined'
  end

  def max_page(result)
    1
  end

  def persist_args(result:, tournament:)
    {}
  end

  def persist(**args)
  end

  def safe_api_call(**args)
    tries = 1

    begin
      result = api_wrapper.call(**args)
      raise result.errors.messages['data'].join(' | ') unless result.errors.messages.empty?
      result
    rescue => e
      if tries <= RETRY
        puts "LOG --- RETRY ##{tries} BECAUSE #{e.message}"
        tries += 1
        sleep(SLEEP)
        retry
      else
        raise e
      end
    end
  end
end
