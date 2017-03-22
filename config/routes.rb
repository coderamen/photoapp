Rails.application.routes.draw do
  root 'pics#index'

  resources :pics do
    member do
      put "like", to: "pics#upvote"
    end
  end

  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
