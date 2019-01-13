class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user. event: :authentication
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].expect("extra")
      redirect_to new_user_session_url
    end
  end

  def error
    redirect_to root_path
  end


end
