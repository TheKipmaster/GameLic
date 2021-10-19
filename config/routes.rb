Rails.application.routes.draw do
  root to: 'welcome#home'
  # get 'midioteca' to: 'welcome#media'

  # get

  resources :narratives do
    resources :posts, only: [:new, :edit, :create, :update, :destroy]
    patch :open_registration, on: :collection
  end

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [ :index, :show, :edit, :update ]
  patch 'users/choose_narrative/:narrative_id', to: 'users#choose_narrative'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
