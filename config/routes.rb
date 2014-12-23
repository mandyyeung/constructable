Rails.application.routes.draw do
  devise_for :users
  resources :requests do
    resources :responses, module: :requests
  end
end
