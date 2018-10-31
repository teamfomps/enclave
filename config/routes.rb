Rails.application.routes.draw do
  devise_for :members
  resources :applicants, only: [:index, :show, :update, :delete]
  resources :members, only: [:index, :show]
  resources :discussions
  resources :categories, only: [:index, :show]
  resources :comments

  unauthenticated :member do
    devise_scope :member do
      root to: 'devise/sessions#new'
    end
  end

  authenticated :member do
    root to: 'frontpage#index', as: 'authenticated_root'
  end

  # Profile Stuff
  resource :profile, only: [:edit, :update, :show]

  # Mailboxer messages
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
    end
  end
  resources :messages, only: [:new, :create]
end
