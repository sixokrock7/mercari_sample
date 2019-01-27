class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  def new
    @resource = User.new
  end

  def identification
    @resource = User.new
  end

  protected

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

end
