OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '583452738346072', 'c51f1dd5164389f8223b06558bf5cfe9',
  :scope => 'email, user_birthday, user_education_history'
end