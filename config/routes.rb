# config/routes.rb
Rails.application.routes.draw do
    resources :friends do
      collection do
        get 'gift_fields'
      end
      resources :gifts, only: [:new, :create, :edit, :update, :destroy]
    end
  
    root "friends#index"
  
    # Health check
    get "up" => "rails/health#show", as: :rails_health_check
end