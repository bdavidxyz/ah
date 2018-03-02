Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['AH_GOOGLE_CLIENT_ID'], ENV['AH_GOOGLE_CLIENT_SECRET']
end
