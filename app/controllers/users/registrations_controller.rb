class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  require "payjp"

  def basic_info
    @user = User.new
  end

  def sms_confirmation
    @user = User.new(user_params)
  end

  def address
    @user = User.new(user_params)
    # binding.pry
  end

  def card
    Payjp.api_key = "sk_test_239caee23576c2acc2d0eec8"

  end

  def create
    @user = User.create(user_params)
    render :card
  end

  def done
  end

  private


  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :phone_number, :id, :credit_card_token, address_attributes: [:first_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefecture_code, :city, :block_number, :building_name, :phone_number]
    )
  end

  def after_sign_up_path_for(resource)
    new_user_registration_path
  end

end
