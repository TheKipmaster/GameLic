Rails.application.routes.draw do
<<<<<<< HEAD
  get 'chat/index'
=======
  root to: 'welcome#index'

>>>>>>> Mail_Narrative
  resources :narratives do
    patch :open_registration, on: :collection
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

<<<<<<< HEAD
  get 'users', to: 'users#index'
  patch 'users/choose_narrative/:narrative_id', to: 'users#choose_narrative'

>>>>>>> origin/Mail_Narrative
  root to: 'welcome#index'

=======
>>>>>>> Mail_Narrative
  devise_for :users, controllers: {
    confirmations: 'confirmations',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [ :index, :show, :edit, :update ]
  patch 'users/choose_narrative/:narrative_id', to: 'users#choose_narrative'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
