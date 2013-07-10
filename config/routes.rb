Learn::Application.routes.draw do
  
  get "static_pages/home"

  get "static_pages/help"
  
  get "static_pages/about"

  resources :categories
  resources :courses

end
