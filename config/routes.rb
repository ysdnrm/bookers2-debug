Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create,:destroy]
    # それ自身のidが分からなくても、関連する他のモデルのidから特定できるから「resource」(id が表示されない)
    resource :favorites, only: [:create,:destroy]
  end
  
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end