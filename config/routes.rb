Rails.application.routes.draw do
  get "about" , to: 'about#index',as: :about
  # get "about-us" , to: 'about#index',as: :about

  # get '/',to:'main#index'

  get "sign_up" , to: "registrations#new"
  post "sign_up" , to: "registrations#create"

  get "sign_in" , to: "sessions#new" 
  post "sign_in" , to: "sessions#create"

  get "password" , to: "passwords#edit" ,as: :edit_password
  patch "password" , to: "passwords#update"

  get "password/reset" , to:"password_resets#new"
  post "password/reset" , to:"password_resets#create"

  get "password/reset/edit" , to: "password_resets#edit"
  patch "password/reset/edit" , to: "password_resets#update"

  delete "logout" , to:"sessions#destroy"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"


  resources :twitter_accounts 
  resources :tweets

  root to:'main#index'
end
