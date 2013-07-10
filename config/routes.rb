Learn::Application.routes.draw do
  
  devise_for :students

  get "static_pages/home"

  get "static_pages/help"
  
  get "static_pages/about"

  resources :categories
  resources :courses

  get "/courses/new/(:category_id)", to: "courses#new"

 root :to => "categories#index"
end
