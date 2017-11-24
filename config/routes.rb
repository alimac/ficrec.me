Rails.application.routes.draw do
  get 'users/new'

  get 'welcome/index'

  resources :fandoms
  resources :collections
  resources :fanworks

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
