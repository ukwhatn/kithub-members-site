# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root
  root 'home#index'

  # oauth
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  scope :register do
    get '1' => 'registerations#step1'
  end

  get 'log_out', to: 'sessions#destroy', as: 'log_out'
end
