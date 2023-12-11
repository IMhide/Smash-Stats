class StartGg::GetParticipants
  PER_PAGE = 200
  Request = StartGg::Client.parse <<~'GRAPHQL'
    query ($event_id: ID, $page: Int, $perPage: Int) {
      event(id: $event_id){
		    id
          standings(query:{ page: $page, perPage: $perPage }){
            nodes{
              placement
              entrant{
                name
                isDisqualified
                initialSeedNum
                participants{
                  id
                  prefix
                  gamerTag
                  verified
                }
              }
            }
            pageInfo{
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
