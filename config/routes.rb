Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show ]
  get '/users/favorite/:id', to: 'users#favorite_index', as: 'favorite_index'
  resources :favorites, only: [:create , :destroy ]
  resources :contacts, only: [:new, :create]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" 
  resources :posts do
    collection do
      post :confirm
    end
  end
end
