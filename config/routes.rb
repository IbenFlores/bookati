Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users do
    resources :sellers, only: %i[create update]
  end
  get "profile", to: "users#profile"
end
