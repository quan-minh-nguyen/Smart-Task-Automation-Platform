Rails.application.routes.draw do
  resources :ctasks
  root 'pages#home'
  resources :tasks
  get '/delete_all_ctasks', to: 'ctasks#delete_all_ctasks', as: 'delete_all_ctasks'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/create_random_task', to: 'tasks#create_random_task', as: 'create_random_task'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/push_back_tasks', to: 'tasks#push_back_tasks', as: 'push_back_tasks'

  # Defines the root path route ("/")
  # root "posts#index"
end
