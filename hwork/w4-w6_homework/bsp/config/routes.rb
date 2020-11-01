Rails.application.routes.draw do
  devise_for :users
  
  get "/users/:user_id" => "users#show", :as => :user_profile

  resources :books do
    resources :comments
  end

  root 'welcome#index'
end
