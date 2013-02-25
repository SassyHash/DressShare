class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :points, :session_token, :first_name, :last_name
end
