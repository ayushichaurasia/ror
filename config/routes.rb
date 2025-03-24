Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root to: "blogs#index", as: :authenticated_root
  end
  root to: "home#index"

  resources :blogs
end
