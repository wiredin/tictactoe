Rails.application.routes.draw do
  resources :spaces, only: [:index, :create, :update, :destroy]
  root "spaces#index" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
