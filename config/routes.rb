Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'tasks/new'
  get 'welcome/index'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :tasks do
    resources :comments
  end

  resources :users

  root 'welcome#index'
end
