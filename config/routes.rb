Rails.application.routes.draw do
  resources :comments
  resources :histories
  resources :posts
  resources :categories
  resources :products
  root "main#index"
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get "posts" => "posts#index"
  resources :users
 

  resources :users do
    get 'custom/products/new'=> "products#new_custom_product"
    get 'custom/products' => "products#custom_products"
    get 'home'=> "main#home_page"
    get 'cart' => "main#cart"
    post 'add_to_cart/:id' => "main#add_to_cart"
    delete 'remove_from_cart/:id' => "main#remove_from_cart"
    get 'checkout' => "histories#add_to_history"
    post 'checkout' => "histories#add_to_history"
    resources :posts , except: [:index]
    resources :products
    resources :comments
    resources :categories
    resources :employees
    resources :histories
  end


  get 'home'=> "main#home_page"
  get   'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

 get "password/reset" => "password_resets#new"
 post "password/reset" => "password_resets#create"
 get "password/reset/edit" => "password_resets#edit"
 patch "password/reset/edit" => "password_resets#update"
 
end
