Rails.application.routes.draw do
  resources :matches
  resources :match_participants do
    collection do
      post 'stat'
    end
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'matches#index'
end
