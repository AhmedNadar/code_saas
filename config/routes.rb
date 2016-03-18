Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users do
    resource :profile
  end

  root to: 'pages#home'
  get '/about' => 'pages#about'

  resources :contacts
end
