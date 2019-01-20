Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :tops, onlu: [:index]
  resources :users, only:[:create, :edit, :show]
end
