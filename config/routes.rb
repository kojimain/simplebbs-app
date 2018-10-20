Rails.application.routes.draw do
  
  scope module: :top do
    root action: :show
  end
  
  namespace :api do
    resources :bbs_threads, only: [:create]
  end
  
end
