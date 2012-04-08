Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env == "production"
    provider :CMU, :host => 'http://128.237.72.144:3000/', :appid => 'teudu', :keyfile => '/usr/local/pubcookie/keys/cmuis.org'
  end
end