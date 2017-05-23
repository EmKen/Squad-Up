Rails.application.routes.draw do
  get 'notifications/:notification_id' => "notifications#show", as: "notification"

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      get '/current_user' => "users#give_current_user"
      resources :users, only: [:index]
      get '/user/:id' => "users#show"
      resource :users, only: [:update] do
        resources :skills, only: [:create, :index]
        post '/add_skill' => "skills#new"
      end

      resources :project_chats, only: [:create, :index]
      post '/mentorships/create_mentor' => 'mentorships#create_mentor'
      post '/mentorships/accept_mentee' => 'mentorships#accept_mentee'
      get '/mentorships/mentor' => 'mentorships#mentor'
      get '/mentorships/mentee' => 'mentorships#mentee'
      
      get '/projects/:project_id' => 'projects#show'
    end
  end

  mount ActionCable.server => '/cable'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root "sessions#new"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, only: [:create]
  resources :projects

  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update ]
  end

  resources :mentorships

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  get "projects/:id/approve" => "projects#approve", as: "project_approve"
  get "projects/:id/refuse" => "projects#refuse", as: "project_refuse"
  get "projects/:id/build_squad" => "projects#build_squad", as: "project_build_squad"
  get "projects/:id/team_members" => "projects#team_members", as: "project_team_members"
  get "projects/:id/edit_skills" => "projects#edit_skills", as: "edit_project_skills"
  patch "projects/:id/update_skills" => "projects#update_skills", as: "update_project_skills"
  get "users/:id/skills" => "users#skills", as: "user_skills"
  post "users/:id/add_skills" => "users#add_skills", as: "add_user_skills"


  resources :skills, only: [:index, :create, :show]

  constraints Clearance::Constraints::SignedIn.new do
   root to: "users#show", as: :signed_in_root
  end

end
