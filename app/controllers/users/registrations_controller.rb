class Users::RegistrationsController < Devise::RegistrationsController

  before_action :set_user


  def basic_info
  end

  def sms_confirmation
  end

  def address
  end

  def card
  end

  def done
  end

  private

  def set_user
    @user = User.new
  end

end
