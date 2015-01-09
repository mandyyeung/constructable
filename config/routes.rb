Rails.application.routes.draw do
  get 'about', to: 'static_pages#about'

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

  resources :tags, only: [:show]

  %w( 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

end
