Rails.application.routes.draw do
  devise_for :users
  resources :messages
  root to: 'events#index'

  resources :posts do
    resources :comments
  end

  namespace :api, defaults: { format: 'json' } do
    resources :users do
      collection do
        post 'authenticate'
        post 'delete_all'
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
