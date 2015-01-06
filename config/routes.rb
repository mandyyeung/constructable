Rails.application.routes.draw do
  get 'static_pages/about'

  devise_for :users

  root to:'requests#dashboard'

  get 'dashboard', to: 'requests#dashboard'

  resources :requests do
    get 'void'
    collection { post :import }
    resources :responses, module: :requests, only: [:create, :edit, :update]
    resources :comments, module: :requests, only: [:create]
  end

end
