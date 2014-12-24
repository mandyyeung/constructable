Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/contact'

  devise_for :users

  root to:'requests#index'
  
  resources :requests do
    resources :responses, module: :requests
  end
end
