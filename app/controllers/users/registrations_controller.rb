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
  end

  def card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @user = User.find(params[:format])

  end

  def create
    super
    @user = User.create(user_params)
    session[:user_id] = @user.id
  end

  def done
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @user = User.find(params[:format])
    @user.update(credit_card_token: params[:payjpToken])
  end

  private


  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :phone_number, :id, :credit_card_token, address_attributes: [:first_name, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefecture_code, :city, :block_number, :building_name, :phone_number]
    )
  end

  def after_sign_up_path_for(resource)
    sign_up_card_path(resource)
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
