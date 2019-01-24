Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registration: "users/registrations",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    get "sign_in" => "devise/sessions#new"
    get "/sign_up/basic_info" => "users/registrations#basic_info"
    get "/sign_up/sms_confirmation" => "users/registrations#sms_confirmation"
    get "/sign_up/address" => "users/registrations#address"
    get "/sign_up/card" => "users/registrations#card"
    get "/sign_up/completed" => "users/registrations#create"
    get "sign_up/done" => "users/registrations#done"
  end

  root "tops#index"
  resources :tops, only: [:index]
  resources :users, only:[:create, :edit, :show]
  resources :mypages, controller: :users, only: [:show]
end
