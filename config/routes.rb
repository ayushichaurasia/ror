Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, sign_out_via: [:get, :delete]
  resources :employees

  resources :salaries, only: [:index, :show] do
    get 'salary_slip/:month/:year', to: 'salaries#show', on: :collection
  end

  namespace :admin do
    resources :salaries, only: [:create, :update]
    resources :attendances, only: [:index, :create, :update] do
      member do
      patch 'update_attendance'
      end
    end
  end

  resources :investments
  root "home#index"
end
