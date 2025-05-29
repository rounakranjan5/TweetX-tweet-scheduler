class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates :username,uniqueness: true

def client
    # Force reload of X gem and create new client
    require "x"
    x_credentials = {
      api_key:             Rails.application.credentials.dig(:twitter, :api_key).to_s,
      api_key_secret:      Rails.application.credentials.dig(:twitter, :api_secret).to_s,
      access_token:        token.to_s,
      access_token_secret: secret.to_s,
      base_url:           "https://api.twitter.com"
    }
    # Explicitly use X::Client to avoid namespace conflict
    @x_client = X::Client.new(**x_credentials)
  end

end

