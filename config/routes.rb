Rails.application.routes.draw do

  devise_for :users

  resources :articles
  get '/mypage', to: 'mypage#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
end
