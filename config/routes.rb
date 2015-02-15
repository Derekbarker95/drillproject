Rails.application.routes.draw do
  
  root 'home#index'

  # TODO: Relationships to be added later
  resources :users, only: [:new, :create]
  resources :tags
  resources :levels

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  resources :drills, only: [] do
    resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  end
  resources :drill_groups, only: [] do
    resources :drills
    resources :subscriptions
    resources :scorecards
    resources :tags, only: [] do
      resources :tagifications, only: [:create, :destroy]
    end
  end
end
