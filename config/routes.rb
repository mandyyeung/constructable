Rails.application.routes.draw do
  get 'static_pages/about'

  devise_for :users

  root to:'requests#dashboard'

  get 'dashboard', to: 'requests#dashboard'

  resources :requests do
    get 'void'
    collection do
      post :import
      match 'search' => 'requests#search', via: [:get, :post], as: :search
    end
    resources :responses, module: :requests, only: [:create, :edit, :update]
    resources :comments, module: :requests, only: [:create]
  end

end
