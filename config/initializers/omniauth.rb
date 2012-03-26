OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google, 'sozkoroglu.me', 'tV2pGD0zltz9mw3bEkccvE5U'
end
