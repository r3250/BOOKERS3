Rails.application.routes.draw do

  devise_for :users
  root 'top#top'
  get '/about' => 'top#about'

  resources :users, only:[:index, :edit, :show, :create, :update]
  resources :books, only:[:index, :create, :edit, :show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
