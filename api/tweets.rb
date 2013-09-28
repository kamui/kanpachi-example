api 'Twitter' do
  section 'Tweets' do
    resource :get, '/statuses/retweets/:id' do
      name 'Retweets of a status'
      description <<-TEXT
Returns a collection of the 100 most recent retweets of the tweet specified by the id parameter.
TEXT
      versions '1.1'
      ssl true
      formats :json

      params do
        optional do
          integer :count, doc: 'Specifies the number of tweets to try and retrieve, up to a maximum of 200. The value of count is best thought of as a limit to the number of tweets to return because suspended or deleted content is removed after the count has been applied. We include retweets in the count, even if `include_rts` is not supplied. It is recommended you always send `include_rts=1` when using this API method.'
          integer :since_id, doc: 'Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.', example: 12345
          integer :max_id, doc: 'Returns results with an ID less than (that is, older than) or equal to the specified ID.', example: 54321
          boolean :trim_user, doc: 'When set to either true, t or 1, each tweet returned in a timeline will include a user object including only the status authors numerical ID. Omit this parameter to receive the complete user object.', example: true
          boolean :contributor_details, doc: 'This parameter enhances the contributors element of the status response to include the screen_name of the contributor. By default only the user_id of the contributor is included.', example: true
          boolean :include_entities, doc: 'The `entities` node will be disincluded when set to false.', example: false
        end
      end

      response do
        status 200
        header 'Content-Type', 'application/json'
        representation do
          include ::Representable::JSON::Collection
          property :title, type: String, doc: "it's the title", example: 'The Title'
          collection :coordinates, doc: "it's the coordinates", example: [100.4, 45.1]
          hash :user, extend: UserRepresenter, doc: "it's the users"
          # include Representable::JSON::Hash
          # values extend: UserRepresenter
        end
      end
    end
  end
end
