Rails.application.routes.draw do
  resources :narratives do
    collection do
      patch :open_registration
    end
  end

  get 'students', to: 'students#index'
  patch 'students/choose_narrative/:narrative_id', to: 'students#choose_narrative'

  root to: 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
