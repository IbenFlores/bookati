Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :users do
    resources :sellers, only: %i[create update]
  end

  resources :books, except: [:index, :show, :edit]
  get "profile", to: "users#profile"
end
