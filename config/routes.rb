Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  root to: "users#index"
  resources :users, only: %i[index]
  resources :groups do
    resources :entities, only: [:index, :show, :new, :create, :destroy]
  end
end
