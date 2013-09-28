api 'Twitter' do
  title 'REST API v1.1 Resources'
  description 'This describes the resources that make up the official Twitter API v1.1'
  host 'api.twitter.com'

  section 'Timelines' do
    description 'Timelines are collections of Tweets, ordered with the most recent first.'
  end

  section 'Tweets' do
    description 'Tweets are the atomic building blocks of Twitter, 140-character status updates with additional associated metadata. People tweet for a variety of reasons about a multitude of topics.'
  end

  section 'Search' do
    description 'Find relevant Tweets based on queries performed by your users.'
  end
end
