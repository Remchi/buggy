Buggy::Application.routes.draw do
  root to: "application#index"
  resources :projects
  resources :issues
  resources :sessions, only: [ :create, :destroy ]
end
