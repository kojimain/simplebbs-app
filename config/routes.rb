Rails.application.routes.draw do
  
  scope module: :top do
    root action: :show
  end
  
end
