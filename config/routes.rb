Rails.application.routes.draw do
  resources :categories do
    resources :tasks
  end
  namespace :category do
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "categories#index"
end
