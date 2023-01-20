Rails.application.routes.draw do
  devise_for :admins
  devise_for :profiles
  get 'welcome/index'
  get 'inicio', to: 'welcome#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "welcome#index"
end
