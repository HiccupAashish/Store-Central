Rails.application.routes.draw do
  resources :histories
  # resources :product_categories
  resources :categories
  resources :products
  root "main#index"
  resources :users
  resources :employees

  resources :users do
    get 'home'=> "main#home_page"
    get 'cart' => "main#cart"
    post 'add_to_cart/:id' => "main#add_to_cart"
    delete 'remove_from_cart/:id' => "main#remove_from_cart"
    get 'checkout' => "histories#add_to_history"
    post 'checkout' => "histories#add_to_history"
    resources :products
    resources :categories
    resources :employees
    resources :histories
  end



  get 'home'=> "main#home_page"
  get   'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
# resources :password_resets, only: [:new, :create, :edit, :update]
 get "password/reset" => "password_resets#new"
 post "password/reset" => "password_resets#create"
 get "password/reset/edit" => "password_resets#edit"
 patch "password/reset/edit" => "password_resets#update"
 
end
