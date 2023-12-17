class StartGg::GetMatches
  PER_PAGE = 10
  Request = StartGg::Client.parse <<~'GRAPHQL'
      query ($event_id: ID,$page: Int, $perPage: Int) {
        event(id: $event_id){
    		id
        sets(page: $page, perPage: $perPage, sortType:  CALL_ORDER){
          nodes{
    				winnerId
            fullRoundText
            winnerId
            completedAt
            games
            {
              entrant1Score	
              entrant2Score
              winnerId
              selections{
                entrant{
                  id
                  participants{
                    id
                  }
                }
                character
                {
                  name
                }
              }
              stage
              {
                name
              }  
            }
            slots{
              entrant{
                id
                participants{
                  id
                }
              }
              standing{
                stats{
                  score{
                    value
                  }
                }
              }
            }
          }
          pageInfo
          {
            page
            totalPages
          }
        }
    	}
    }
  GRAPHQL

  def self.call(event_id:, page: 1)
    StartGg::Client.query(Request, variables: {event_id: event_id, page: page, perPage: PER_PAGE})
  end
end
