Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      get '/current_user' => "users#give_current_user"
      resources :users, only: [:show, :index] #do 
      #   resources :skill
      # end

      resource :users, only: [:update] do
        resources :skills, only: [:create]
        post '/add_skill' => "skills#new"
      end

      

      
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root "sessions#new"
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]

  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update, ]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  resources :skills, only: [:index, :create]

  constraints Clearance::Constraints::SignedIn.new do
   root to: "users#show", as: :signed_in_root
  end

end
