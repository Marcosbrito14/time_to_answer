Rails.application.routes.draw do
  namespace :users_backoffice do
    get 'welcome/index'
  end
  devise_for :users
  namespace :site do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'#Dashboard
    resources :admins#Administradores
    #get 'admins/index'
    #get 'admins/edit/:id, to: 'admins#edit'
  end
  devise_for :admins

  get 'inicio', to: 'site/welcome#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "site/welcome#index"
end
