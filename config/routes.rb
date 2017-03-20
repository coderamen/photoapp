Rails.application.routes.draw do
  root 'welcome#index'

  resources :pics

  get 'signup', to: 'users#new'
  post 'user', to: 'users#create'
  resources :users, except: [:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
