Koala.configure do |config|
  config.app_id = ENV['FACEBOOK_KEY']
  config.app_secret = ENV['FACEBOOK_SECRET']
  config.api_version = 'v2.1'
end