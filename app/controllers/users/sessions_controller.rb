class Users::SessionsController < Devise::SessionsController
  # before_action :authenticate_user!

  def new
    super
  end

  def create
    super
  end

  def identification
    super
  end

  def destroy
  end

  protected

  def after_sign_in_path_for(resource)
    new_user_session_path
  end

end
