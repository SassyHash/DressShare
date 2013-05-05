Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['583452738346072'], ENV['c51f1dd5164389f8223b06558bf5cfe9']
end