Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registration: "users/registrations",
    passwords: "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }, skip: [:sessions]
  devise_scope :user do
    get "users/sign_in" => "users/sessions#new", as: :new_user_session
    post "user/sign_in" => "users/sessions#create", as: :user_session
    get "users/sign_in/identification" => "users/sessions#identification"
    match 'users/logout' => 'users/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
    get 'users/logout' => 'users/sessions#destroy'
    get "/sign_up/basic_info" => "users/registrations#basic_info"
    post "/sign_up/sms_confirmation" => "users/registrations#sms_confirmation"
    post "/sign_up/address" => "users/registrations#address"
    post "/sign_up/card" => "users/registrations#card"
    post "/sign_up/completed" => "users/registrations#create"
    get "sign_up/done" => "users/registrations#done"
  end

  root "tops#index"
  resources :tops, only: [:index]
  resources :users, only:[:create, :edit, :show, :destroy] do
    resources :addresses do
    end
  end
  resources :mypages, controller: :users, only: [:show]
end
