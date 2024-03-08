Rails.application.routes.draw do
  get "/" => "posts#index"
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"

  get "posts/:id" => "posts#show"
  get "posts" => "posts#index"

  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/destroy" => "posts#destroy"
  
  post "posts/:id/update" => "posts#update"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :task
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"



end
