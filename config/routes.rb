Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create] do
      member do
        post :create_reply
      end
    end
  end

  root 'posts#index'
end
