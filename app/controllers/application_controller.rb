class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    added_keys = [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :email, :password, :birth_year, :birth_month, :birth_day, :icon_image, :background_image, :profile]

    devise_parameter_sanitizer.permit(:sign_up, keys: added_keys)
  end
end
