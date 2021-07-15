Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :narratives do
    patch :open_registration, on: :collection
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: [ :index, :show, :edit, :update ]
  patch 'users/choose_narrative/:narrative_id', to: 'users#choose_narrative'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
