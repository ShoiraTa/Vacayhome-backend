# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :houses, only: [:index, :show,:new, :create, :update, :destroy] 
      resources :bookings, only: [:index, :show,:new, :create, :update, :destroy]
      resources :users, only:[:index, :create, :show]
    end
  end
end
