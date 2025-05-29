class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
   return if tweet.published?

  #  Check if the tweet is scheduled for a future time
   return if tweet.publish_at > Time.current

   tweet.publish_to_twitter!
  end
end
