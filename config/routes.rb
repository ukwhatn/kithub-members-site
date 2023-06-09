Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root
  root 'home#index'

  # auth
  scope :auth, as: 'auth' do
    get ':provider/callback', to: 'sessions#create'
    get 'failure', to: redirect('/')
    get 'not_found', to: 'sessions#not_found'
  end

  # session
  scope :session, as: 'session' do
    delete 'sign_out', to: 'sessions#destroy'
    delete ':provider/sign_out', to: 'sessions#destroy_auth', as: 'sign_out_provider'
  end

  # register
  scope :register, as: 'register' do
    get '/' => 'registrations#new', as: :register
    post '/' => 'registrations#create'
    get '/decline' => "registrations#decline", as: :decline
  end

  # members
  scope :members, as: 'members' do
    get '/' => 'members#index', as: :my_page
    get '/:id' => 'members#show', as: :member
  end

  # events
  scope :events, as: 'events' do
    get '/' => 'events#index', as: :events
    post '/' => 'events#create'
    get '/new' => 'events#new', as: :new_event
    get '/:id' => 'events#show', as: :event
  end

  # API
  scope :api, as: 'api' do
    # faculties
    scope :faculties do
      get '/:id/departments' => 'faculties#get_departments', as: :get_departments
    end
  end
end
