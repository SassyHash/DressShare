
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

 def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      if @user.school_id?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        flash[:notice] = "You have successfully logged in with Facebook." if is_navigational_format?
      else
        sign_in_and_redirect(@user)
        flash[:notice] = "Please provide your school and year information." 
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure 
   flash[:error] = "Failed to authenticate against facebook"
   redirect_to new_user_registration_url
 end
end