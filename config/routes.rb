Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  scope module: :public do
    devise_for :users
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    resources :posts, only: [:new, :show, :index, :edit, :create, :destroy, :update] do
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :index, :edit, :destroy, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
