Rails.application.routes.draw do
  resources :users
  resources :sessions
  get 'login' => "sessions#new"

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
