Rails.application.routes.draw do
  devise_for :members
  resources :members, only: [:index, :show]

  unauthenticated :member do
    devise_scope :member do
      root to: 'devise/sessions#new'
    end
  end

  authenticated :member do
    root to: 'frontpage#index', as: 'authenticated_root'
  end

  # Mailboxer messages
  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end

    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]
end
