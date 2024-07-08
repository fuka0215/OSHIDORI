Rails.application.routes.draw do

  root to: "homes#top"
  get "/about" => "homes#about", as: "about"
  devise_for :users
  resources :posts, only: [:new, :show, :index, :edit, :create, :destroy, :update] do
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :destroy, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
