Buggy::Application.routes.draw do
  root to: "application#index"
  resources :projects
end
