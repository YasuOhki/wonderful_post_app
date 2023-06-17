Rails.application.routes.draw do

  devise_for :users,:controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  resources :articles
  resources :mypage
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
end
