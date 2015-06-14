require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_KEY'], ENV['SPOTIFY_SECRET'],scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :spotify, 'app_id', 'app_secret', scope: 'playlist-read-private user-read-private user-read-email'
# end