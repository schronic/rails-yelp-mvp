Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: [ :new, :create, :index]
  end
  resources :reviews, only: [ :show, :edit, :update, :destroy ]
end
