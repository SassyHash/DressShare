Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '583452738346072', 'c51f1dd5164389f8223b06558bf5cfe9', 
  :scope => "email, user_birthday, first_name, last_name", :display => 'popup'
end