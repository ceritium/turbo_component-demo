Rails.application.routes.draw do
  TurboComponent::Router.load_routes!(self)

  resources :items
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'categories#index'
end
