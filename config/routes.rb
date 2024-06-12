Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index, :show]
  devise_for :users
  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
