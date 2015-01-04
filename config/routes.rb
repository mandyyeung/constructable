Rails.application.routes.draw do
  get 'static_pages/about'

  devise_for :users

  root to:'requests#index'

  resources :requests do
    get 'void'
    collection { post :import }
    resources :responses, module: :requests
  end

end
