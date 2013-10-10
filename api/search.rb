api 'Twitter' do
  section 'Search' do
    resource :get, '/search/tweets' do
      name 'Retweets of a status'
      description <<-END
Returns a collection of relevant Tweets matching a specified query.

Please note that Twitter's search service and, by extension, the Search API is
not meant to be an exhaustive source of Tweets. Not all Tweets will be indexed
or made available via the search interface.

In API v1.1, the response format of the Search API has been improved to return
Tweet objects more similar to the objects you'll find across the REST API and
platform. You may need to tolerate some inconsistencies and variance in
perspectival values (fields that pertain to the perspective of the
  authenticating user) and embedded user objects.

To learn how to use Twitter Search effectively, consult our guide to Using the
Twitter Search API. See Working with Timelines to learn best practices for
navigating results by since_id and max_id.
      END
      versions '1.1'
      ssl true
      formats :json

      params do
        optional do
          string :q,
            doc: 'Specifies the number of tweets to try and retrieve, up to a
maximum of 200. The value of count is best thought of as a limit to the number
of tweets to return because suspended or deleted content is removed after the
count has been applied. We include retweets in the count, even if `include_rts`
is not supplied. It is recommended you always send `include_rts=1` when using
this API method.'
          array :geocode,
            doc: 'Returns results with an ID greater than (that is, more recent
than) the specified ID. There are limits to the number of Tweets which can be
accessed through the API. If the limit of Tweets has occured since the since_id,
the since_id will be forced to the oldest ID available.',
            example: 12345
          integer :max_id,
            doc: 'Returns results with an ID less than (that is, older than) or
equal to the specified ID.',
            example: 54321
          boolean :trim_user,
            doc: 'When set to either true, t or 1, each tweet returned in a
timeline will include a user object including only the status authors numerical
ID. Omit this parameter to receive the complete user object.',
            example: true
          boolean :contributor_details,
            doc: 'This parameter enhances the contributors element of the status
response to include the screen_name of the contributor. By default only the
user_id of the contributor is included.',
            example: true
          boolean :include_entities,
            doc: 'The `entities` node will be disincluded when set to false.',
            example: false
        end
      end

      response do
        status 200
        header 'Content-Type', 'application/json'
        representation do
          include ::Representable::JSON::Collection

          property :title,
            type: String,
            doc: 'The title',
            example: 'The Title'
          collection :coordinates,
            doc: 'The coordinates',
            example: [100.4, 45.1]
        end
      end
    end
  end
end
