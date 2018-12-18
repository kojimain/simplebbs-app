Rails.application.routes.draw do
  
  scope module: :top do
    root action: :show
  end
  resources :bbs_threads, only: [:show]
  
  namespace :api do
    resources :bbs_threads, only: [:create, :destroy, :index] do
      resources :bbs_posts, only: [:create]
    end
    resources :bbs_posts, only: [:destroy]
  end
  
end
