Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  devise_scope :user do
    authenticated :user do
      root to: 'index#index'
    end
    resources :user, :controller => "user"
    unauthenticated :user do
      root to: 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  post '/', controller: :index, action: :select_building, as: :select_building

  resources :buildings, only: [:new, :create, :show, :index] do
    resources :news, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :workorders, only: [:new, :create, :index, :update]
    resources :help_requests, only: [:index, :destroy, :new, :create]
    resources :facilities, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
      resources :bookings, only: [:new, :create, :index, :show, :edit, :destroy]
      resources :timeslots, only: [:create, :destroy]
      resources :timelists, only: [:create, :destroy]
    end
  end



  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/registrations'
      }
      resources :news, only: [:index], defaults: { format: 'json' }
      resources :buildings, only: [:index], defaults: { format: 'json' }
      resources :timelists, only: [:index], defaults: { format: 'json' }
      resources :facilities, only: [:index, :show], defaults: { format: 'json'} do
        resources :bookings, only: [:new, :create, :index, :show, :edit, :destroy], defaults: { format: 'json'}
        resources :timeslots, only: [:index]
      end
      resources :help_requests, only: [:create], defaults: { format: 'json' }
    end
  end
end
