Rails.application.routes.draw do
  # resources :users

  root to: 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
