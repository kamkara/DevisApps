Rails.application.routes.draw do
  resources :line_item_dates, only: [:index, :show]

  resources :quotes do
    resources :line_item_dates, except: [:index, :show]
  end
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
