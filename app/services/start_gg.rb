module StartGg
  START_GG_URL = 'https://api.start.gg/gql/alpha'
  API_KEY = Rails.application.credentials.start_gg_api_key

  HTTP = GraphQL::Client::HTTP.new(START_GG_URL) do
    def headers(context)
      # Optionally set any HTTP headers
      {Authorization: "Bearer #{API_KEY}"}
    end
  end

  Schema = GraphQL::Client.load_schema(HTTP)
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end
