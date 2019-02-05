class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :phone_number, presence: true

  has_many :authorizations
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, update_only: true

  def cards
    Payjp.api_key = "sk_test_239caee23576c2acc2d0eec8"
    customer = Payjp::Customer.retrieve(self.pay.customer)
    customer.cards.data
  end

  protected

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    authoraization = Authorization.where(uid: auth.uid, provider: auth.provider).first
    if authorization.present?
      user = User.where(id: authorization.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        Authorization.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email: auth.info.email,
          password: Devise.frendly_token[0, 20]
          )
        user_id = user.id
        Authorization.create(
          uid: uid,
          provider: provider,
          user_id: user_id
          )
      end
      return user
    end
  end
end
