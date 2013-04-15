
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '136360799881017', '9925bb5126d7f60445c8f026797a9210'
end

