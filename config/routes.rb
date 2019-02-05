Rails.application.routes.draw do
  resources :dogs, only: [:index, :show]
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get "/dogs?sort=asc", to: "dogs#index", as: 'sort_dog'
end
