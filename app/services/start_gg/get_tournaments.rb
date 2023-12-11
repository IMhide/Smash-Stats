class StartGg::GetTournaments
  PER_PAGE = 200
  Request = StartGg::Client.parse <<~'GRAPHQL'
    query($page: Int, $perPage: Int) {
      tournaments(query: {
        page: $page,
        perPage: $perPage,
        filter: { countryCode: "FR", past: true, videogameIds: [1386] },
        sortBy: "startAt DESC"
      })
        {
          nodes{
            id
            name
            slug
            addrState
            countryCode
            venueName
            postalCode
            venueAddress

            events(filter:{videogameId: 1386, type: 1}){
              id
              name
              numEntrants
              state
              isOnline
              startAt
            }
          }
          pageInfo{
            totalPages
          }
      	}
    }
  GRAPHQL

  def self.call(page: 1)
    StartGg::Client.query(Request, variables: {page: page, perPage: PER_PAGE})
  end
end
