Rails.application.routes.draw do
  get 'chat/index'
  resources :narratives do
    collection do
      patch :open_registration
    end
  end
  
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  # resources :users
  # root 'chat#index'
  root to: 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
