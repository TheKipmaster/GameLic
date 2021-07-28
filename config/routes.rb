Rails.application.routes.draw do
  get 'chat/index'
  resources :narratives do
    collection do
      patch :open_registration
    end
  end
<<<<<<< HEAD
  
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  # resources :users
  # root 'chat#index'
=======

  get 'users', to: 'users#index'
  patch 'users/choose_narrative/:narrative_id', to: 'users#choose_narrative'

>>>>>>> origin/Mail_Narrative
  root to: 'welcome#index'

  devise_for :users, controllers: {
    confirmations: 'confirmations',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
