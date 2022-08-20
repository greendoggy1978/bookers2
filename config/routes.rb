Rails.application.routes.draw do
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get 'books/new'
 get 'top' => 'homes#top'
 post 'books' => 'books#create'
 get 'books' => 'books#index'

 devise_for :users
 root to: "homes#top"

 resources :users, only:[:show, :edit, :update]
 get "home/about" => "homes#about", as: "about"

 resources :books, only: [:new, :create, :index, :show, :destroy]

end
