class StartGg::GetTournaments < StartGg::BaseService
  PER_PAGE = 340
  Request = StartGg::Client.parse <<~'GRAPHQL'
    query($page: Int, $perPage: Int) {
      tournaments(query: {
        page: $page,
        perPage: $perPage,
        filter: { countryCode: "FR",past: true, videogameIds: [1386] },
        sortBy: "startAt DESC"
      })
        {
          nodes{
            id
            name
            slug
            events(filter:{videogameId: 1386, type: 1}){
              id
              name
              numEntrants
              state
            }
          }
          pageInfo{
            page
            totalPages
          }
      	}
    }
  GRAPHQL

  def call(page: 1)
    StartGg::Client.query(Request, variables: {page: page, perPage: PER_PAGE})
  end
end
